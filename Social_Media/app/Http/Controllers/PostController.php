<?php

namespace App\Http\Controllers;

use App\Http\Resources\postInformationResource;
use App\Models\post;
use App\Models\userfollowers;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class PostController extends Controller
{
    use ApiResponseTrait;
    public function createNewPost(Request $request)
    {
        $userID = Auth::user()->id;
        $data = $request->validate([
            'post_body' => 'string',
        ]);
        $post = Post::create([
            'user_id' => $userID,
            'user_profile_id' => $userID,
            'post_body' => $data['post_body'],
            'post_time' => Carbon::now()->format('H:i:s'),
            'post_date' => Carbon::now()->format('Y-m-d'),
        ]);
        $postResult = postInformationResource::make($post);
        return $this->ApiResponse($postResult, 'Post created successfully', 201);
    }

    public function editPost()
    {
    }

    public function showAllUserPost()
    {
        $userID = Auth::user()->id;
        $userPosts = postInformationResource::collection(post::where('user_id', $userID)->get());
        return $this->ApiResponse($userPosts, 'Information returned successfully', 200);
    }

    public function showMyFollowingPosts()
    {
        $userID = Auth::user()->id;
        $userFollowing =userfollowers::where('user_id', $userID)->get();
        $ids = $userFollowing->pluck('user_profile_id')->toArray();
        $finalResult=postInformationResource::collection(post::whereIn('user_profile_id',$ids)->get());
        return $this->ApiResponse($finalResult,'Information returned successfully',200);
    }

    public function deletePost()
    {
    }

    public function savePost()
    {
    }

    public function promotPost()
    {
    }

    public function showAllWorldPosts()
    {
    }

    public function likePost()
    {
    }

    public function commentOnPost()
    {
    }

    public function deleteComment()
    {
    }

    public function showAllComments()
    {
    }

    public function sharePost()
    {
    }

    public function showSharedPosts()
    {
    }

    public function deleteSharedPost()
    {
    }
}
// 'photo_path' => 'image' | 'mimes:jpg,bmp,png,jpeg',
// 'video_path' => 'mimetypes:video/avi,video/mpeg,video/quicktime'
