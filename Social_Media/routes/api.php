<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Auth\GoogleController;
use App\Http\Controllers\GoogleAuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
 use App\Http\Controllers\Auth\ResetPasswordController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::middleware('auth:api')->group(function () {
    Route::get('logout', [AuthController::class, 'logout']);
});

 //////////////// authenctication /////////////////
Route::post('/register', [AuthController::class,'register']);
Route::post('/login', [AuthController::class,'login']);
//////////////// with google /////////////////////


Route::get('google/login/url', [GoogleAuthController::class,'getAuthUrl']);

Route::post('google/auth/login', [GoogleAuthController::class,'postLogin']);


///////////  reset password  ////////////////////
 Route::post('forget-password', [ResetPasswordController::class,'forgot_Password']);
Route::post('code-check',[ResetPasswordController::class,'check_code']);
Route::post ('update-password', [ResetPasswordController::class,'update_password']);
