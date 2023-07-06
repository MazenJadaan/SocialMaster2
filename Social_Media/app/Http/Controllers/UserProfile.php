<?php

namespace App\Http\Controllers;

use App\Models\User_profile;
use App\Models\userfollowers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;
use App\Models\post;
use App\Http\Resources\UserProfileInformationsResource;
use App\Http\Resources\showProfileDetails;
use App\Models\officialaccounts;
use App\Models\User;
use Exception;
// use Exception;
use Stripe;
// use Stripe\Stripe as StripeStripe;

class UserProfile extends Controller
{
    use ApiResponseTrait;

    public function showMyProfile()
    {
        $myid = Auth::id();
        $user = User::select('id', 'first_name', 'last_name', 'phone_num', 'gender', 'birthdate')->with('user_profile')->find($myid);
        return $this->ApiResponse($user, ' My Profile Information returned successfully', 200);
    }
    public function addInformations(Request $request)
    {
        $data = $request->validate([
            'job' => 'nullable|regex:/^[A-Za-zأ-ي\s]+$/u',
            'study_place' => 'nullable|regex:/^[A-Za-zأ-ي\s]+$/u',
            'place_stay' => 'nullable|regex:/^[A-Za-zأ-ي\s]+$/u',
            'place_born' => 'nullable|regex:/^[A-Za-zأ-ي\s]+$/u',
            'bio' => 'nullable|regex:/^[A-Za-zأ-ي\s]+$/u|max:50',
            'state' => 'nullable|in:single,engaged,married,in_relationship',
        ]);
        $userID = Auth::id();
        $user_profile = User_profile::find($userID);
        $user_profile->update($data);
        $user = UserProfileInformationsResource::make(User_profile::find($userID));
        return $this->ApiResponse($user, 'Information updated successfully', 201);
    }

    public function editProfilePhoto(Request $request)
    {
        $data = $request->validate([
            'profile_photo' => 'image|mimes:jpg,jpeg',
        ]);
        $userID = Auth::user()->id;
        $user_profile = User_profile::find($userID);
        if ($request->hasFile('profile_photo')) {
            $imageName = time() . '.' . $request->file('profile_photo')->extension();
            $request->file('profile_photo')->storeAs('images/profile_picture/', $imageName);
            $name_path = 'storage/app/images/profile_picture/' . $imageName;
            $user_profile->profile_photo = $name_path;
            $user_profile->save();
        }
        return $this->ApiResponse('', 'Information updated successfully', 201);
    }

    public function editCoverPhoto(Request $request)
    {
        $data = $request->validate([
            'cover_photo' => 'image|mimes:jpg,jpeg',
        ]);
        $userID = Auth::user()->id;
        $user_profile = User_profile::find($userID);
        if ($request->hasFile('cover_photo')) {
            $imageName = time() . '.' . $request->file('cover_photo')->extension();
            $request->file('cover_photo')->storeAs('images/cover_picture/', $imageName);
            $name_path = 'storage/app/images/cover_picture/' . $imageName;
            $user_profile->cover_photo = $name_path;
            $user_profile->save();
        }
        return $this->ApiResponse('', 'Information updated successfully', 201);
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
        $userUnFollow = Userfollowers::where([
            ['user_id', $userID],
            ['user_profile_id', $profileID]
        ])->delete();

        $userProfile = User_profile::find($id);
        $userProfile->decrement('followers_number', 1);
        $userProfile->save();

        return $this->ApiResponse('null', 'unfollowing its done ', 200);
    }



    public function showProfile($id)
    {
        $profileID = User_profile::find($id);
        //هل نحتاج نهندل حالة عدم وجود بروفايل اصلا ؟؟
        $user = showProfileDetails::collection(User::with('user_profile')->find($profileID));
        return $this->ApiResponse($user, 'Profile returned successfully', 200);
    }

    public function makeProfileOfficial($id, Request $request)
    {
        // $profileID = User_profile::find($id)->id;
        $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
        // $res = $stripe->tokens->create([
        //     'card' => [
        //         'number' =>'4000005280000002',
        //         'exp_month' =>6,
        //         'exp_year' => 2024,
        //         'cvc' => '314',
        //     ],
        // ]);
        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        $response = $stripe->charges->create([
            'amount' => 2000,
            'currency' => 'USD',
            'source' => 'tok_nl',
            'description' => 'Pay for make profile official',
        ]);
        return $this->ApiResponse($response, 'Congratulations! Your account verification was successful.', 200);

        $user = officialaccounts::create([
            'user_profile_id' => $id
        ]);
    }

    public function showProfilesPosts(User_profile $profile)
    {
        $returnPosts = post::where('user_profile_id', $profile->id)->get();

        //نجهز الريسورس لوقت نجهز البوستات
    }
}
