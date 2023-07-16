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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Stripe;

// use Exception;
// use Stripe\Stripe as StripeStripe;

class OtherUserProfile extends Controller
{
    use ApiResponseTrait;


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
            $userProfile->increment('followers_number', 1);
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
            ])->delete();
            $userProfile = User_profile::find($id);
            $userProfile->decrement('followers_number', 1);
            $userProfile->save();
        }
        return $this->ApiResponse('null', 'unfollowing its done ', 200);
    }



    public function showProfile($id)
    {
        $profileID = User_profile::find($id);
        //هل نحتاج نهندل حالة عدم وجود بروفايل اصلا ؟؟
        $user = showProfileDetails::collection(User::with('user_profile')->find($profileID));
        return $this->ApiResponse($user, 'Profile returned successfully', 200);
    }

}
