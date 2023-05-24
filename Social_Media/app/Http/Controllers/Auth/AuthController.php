<?php

namespace App\Http\Controllers\Auth;


use App\Http\Controllers\Controller;
use App\Models\ResetCodePassword;
use App\Models\User;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{
    use ApiResponseTrait;
    public function register(Request $request)
    {
        $data = $request->validate([
            'first_name' => 'required|max:125',
            'last_name' => 'required|max:125',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:8',
            'phone_num' => 'required|numeric|unique:users',
            'gender'=>'required|in:female,male',
            'birthdate'=>'required|date'
        ]);
        $user = User::create($data);
       $token = $user->createToken('User Api Token')->accessToken;
    return  $this -> ApiResponse([ 'user' => $user, 'token' => $token],'Account created successfully',200);
    }


    public function login(Request $request)
    {
       $data = $request->validate(['emailORmobile' => 'required',
            'password' => 'required|min:8']);
       $email_mobile = $request->get('emailORmobile');
       $password = $request->get('password');
        $user = User::where('phone_num', $email_mobile)->orWhere('email', $email_mobile)->first();

       if(!$user  || !Hash::check($password, $user->password)){
           return $this -> ApiResponse(['data'=>null], 'some entered data are incorrect',400);
       }
        $token = $user->createToken('User Api Token')->accessToken;

        return  $this -> ApiResponse([ 'user' => $user, 'token' => $token],'login successfully',200);
    }
    public function logout()
    {

        $token = auth()->user()->token();
        $token->revoke();
        $token->delete();
        return response()->json([
            'message' => 'Successfully logged out'
        ],200);
    }



}
