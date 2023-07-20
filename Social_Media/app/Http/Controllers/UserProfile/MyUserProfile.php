<?php

namespace App\Http\Controllers\UserProfile;

use App\Http\Controllers\Controller;
use App\Http\Resources\showProfileDetails;
use App\Http\Resources\UserProfileInformationsResource;
use App\Models\officialaccounts;
use App\Models\post;
use App\Models\User;
use App\Models\User_profile;
use App\Models\userfollowers;
use App\Traits\ApiResponseTrait;
use App\Traits\PostsTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Stripe;

// use Exception;
// use Stripe\Stripe as StripeStripe;


class MyUserProfile extends Controller
{
    use ApiResponseTrait,PostsTrait;

    public function showMyProfile()
    {
        $myid = Auth::id();
        $user = User::select('id', 'first_name', 'last_name', 'gender', 'birthdate')->with('user_profile')->find($myid);
        $posts = $this->getProfilePosts($myid);
        $arr = ['profile information' => $user,
            'all posts' => $posts];
        return $this->ApiResponse($arr, ' My Profile Information returned successfully', 200);
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

    public function makeProfileOfficial($id, Request $request)
    {
        // $profileID = User_profile::find($id)->id;
        $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
        // $res = $stripe->tokens->create([
        //     'card' => [
        //         'number' =>bcrypt('4000005280000002'),
        //         'exp_month' =>bcrypt(6),
        //         'exp_year' => bcrypt(2024),
        //         'cvc' => bcrypt('314'),
        //     ],
        // ]);
        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        $response = $stripe->charges->create([
            'amount' => 2000,
            'currency' => 'USD',
            'source' => 'tok_nl',
            'description' => 'Pay for make profile official',
        ]);
        $official = officialaccounts::create([
            'user_profile_id' => $id
        ]);
        return $this->ApiResponse($response, 'Congratulations! Your account verification was successful.', 200);
    }

}