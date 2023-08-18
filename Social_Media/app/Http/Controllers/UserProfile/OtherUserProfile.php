<?php

namespace App\Http\Controllers\UserProfile;

use App\Http\Controllers\Controller;
use App\Http\Resources\showProfileDetails;
use App\Http\Resources\UserProfileInformationsResource;
use App\Models\officialaccounts;
use App\Models\User;
use App\Models\User_profile;
use App\Models\userfollowers;
use App\Traits\ApiResponseTrait;
use App\Traits\PostsTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Stripe;

// use Exception;
// use Stripe\Stripe as StripeStripe;

class OtherUserProfile extends Controller
{
    use ApiResponseTrait,PostsTrait;

    public function showProfile($id)
    {
//        $profileID = User_profile::find($id);
        //هل نحتاج نهندل حالة عدم وجود بروفايل اصلا ؟؟
//        $user = showProfileDetails::collection(User::with('user_profile')->find($profileID));
        $user = User::select('id', 'first_name', 'last_name', 'gender', 'birthdate')->with('user_profile')->find($id);
        $posts = $this->getProfilePosts($id);

        $array = [
            'user information'=>$user ,
            'user posts' => $posts
        ];
        return $this->ApiResponse($array, 'Profile returned successfully', 200);
    }


    public function follow($id)
    {
        $profileID = User_profile::find($id)->id;
        $userID = (Auth::id());
        $userAlreadyFollower = userfollowers::where([
            ['user_id', $userID],
            ['user_profile_id', $profileID]
        ])->first();
        if ($userID != $profileID && !$userAlreadyFollower) {
            $follow = userfollowers::create([
                'user_id' => $userID,
                'user_profile_id' => $profileID
            ]);
            $userProfile = User_profile::find($id);
            $user_visitor = User_profile::find($userID);
            $userProfile->increment('followers_number', 1);
            $user_visitor->increment('following_number',1);
            $userProfile->save();
            return $this->ApiResponse('null', 'follow is done', 200);
        } elseif ($userID == $profileID) {
            return $this->ApiResponse('null', 'you cant follow yourself يا متوحد', '401');
        } elseif ($userAlreadyFollower) {
            return $this->ApiResponse('null', 'you already following this user', '401');
        }
    }

    public function unFollow($id)
    {
        $profileID = User_profile::find($id)->id;
        $userID = (Auth::id());
        if($userID == $profileID) {
            return $this->ApiResponse('null', 'you cant unfollowing your self', 200);
        }
        else{
            $userUnFollow = Userfollowers::where([
                ['user_id', $userID],
                ['user_profile_id', $profileID]
            ])->first();
            if(!$userUnFollow){
                return $this->ApiResponse('null', 'you already unfollow this user', 200);
            }
            else {
                $userUnFollow->delete();
                $userProfile = User_profile::find($id);
                $user_visitor = User_profile::find($userID);
                $userProfile->decrement('followers_number', 1);
                $user_visitor->decrement('following_number', 1);
                $userProfile->save();
                return $this->ApiResponse('null', 'unfollowing its done ', 200);
            }
        }

    }

}
