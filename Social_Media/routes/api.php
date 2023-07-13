<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\GoogleAuthController;
use App\Models\User;
use App\Models\User_profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\ResetPasswordController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\StoriesController;
use App\Http\Controllers\UserProfile;

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

    Route::post('/complete_register', [AuthController::class, 'complete_register']);

    Route::get('showMyProfile', [UserProfile::class, 'showMyProfile']);

    Route::post('addProfileInformations', [UserProfile::class, 'addInformations']);

    Route::post('updateProfileInformations', [UserProfile::class, 'updateInformations']);

    Route::post('updateProfilePicture', [UserProfile::class, 'editProfilePhoto']);

    Route::post('updateProfileCover', [UserProfile::class, 'editCoverPhoto']);

    Route::post('followProfile/{id}', [UserProfile::class, 'follow']);

    Route::get('showProfile/{id}', [UserProfile::class, 'showProfile']);

    Route::delete('unFollow/{id}', [UserProfile::class, 'unFollow']);

    Route::Post('makeProfileOfficial/{id}', [UserProfile::class, 'makeProfileOfficial']);

    Route::post('searchUsers', [SearchController::class, 'searchIntoUsers']);

    Route::post('searchPosts',[SearchController::class,'searchIntoPosts']);

    Route::post('addStories', [StoriesController::class, 'addStory']);

    Route::get('showCurrentStory', [StoriesController::class, 'showStoryDetail']);

    Route::get('showOldestStory', [StoriesController::class, 'showArchiveStories']);

    Route::get('showFollwingStory', [StoriesController::class, 'showStory']);

    Route::delete('deleteStory/{id}', [StoriesController::class, 'deleteStory']);

    Route::post('Createnewpost', [PostController::class, 'createNewPost']);

    Route::get('returnMyPosts', [PostController::class, 'showAllUserPost']);

    Route::get('returnMyFollowingPosts', [PostController::class, 'showMyFollowingPosts']);

    Route::delete('deletePosts/{id}', [PostController::class, 'deletePost']);

    Route::post('savePosts/{id}', [PostController::class, 'savePost']);

    Route::get('showSavedPosts', [PostController::class, 'showSavedPosts']);

    Route::delete('cancelSavePost/{id}', [PostController::class, 'removePostsFromSavedLists']);

    Route::get('allWorldTimeLine', [PostController::class, 'showAllWorldPosts']);

    Route::post('Like/{id}', [PostController::class, 'likePost']);

    Route::delete('removeLike/{id}', [PostController::class, 'removeLikeFromPost']);
});


//////////////// authenctication /////////////////
Route::post('/register', [AuthController::class, 'register']);

Route::post('/login', [AuthController::class, 'login']);



//////////////// with google /////////////////////
Route::get('google/login/url', [GoogleAuthController::class, 'getAuthUrl']);
Route::post('google/auth/login', [GoogleAuthController::class, 'PostLoginByGoogle']);


///////////  reset password  ////////////////////
Route::post('forget-password', [ResetPasswordController::class, 'forgot_Password']);
Route::post('code-check', [ResetPasswordController::class, 'check_code']);
Route::post('update-password', [ResetPasswordController::class, 'reset_password']);
