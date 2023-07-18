<?php

namespace App\Http\Controllers;

use App\Http\Resources\postInformationResource;
use App\Models\like;
use App\Models\post;
use App\Models\savepost;
use App\Models\userfollowers;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class PostController extends Controller
{
    use ApiResponseTrait;
    //dont know if done or not yet
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
<<<<<<< HEAD
    //not done yet
    public function showAllUserPost()
    {
        $userID = Auth::user()->id;
        $userPosts = DB::table('posts')
            ->join('users', 'posts.user_id', '=', 'users.id')
            ->join('user_profiles', 'posts.user_profile_id', '=', 'user_profiles.id')
            ->where('posts.user_id', $userID)
            ->orderBy('posts.created_at','desc')
            ->get();
        if (!$userPosts->count())   
            return $this->ApiResponse('', 'No posts added yet', 404);
        return $this->ApiResponse($userPosts, 'Information returned successfully', 200);
    }
    //not done yet
    public function showMyFollowingPosts()
=======


//    public function showAllUserPost()
//    {
//        $userID = Auth::user()->id;
//        $userPosts = DB::table('posts')
//            ->join('users', 'posts.user_id', '=', 'users.id')
//            ->join('user_profiles', 'posts.user_profile_id', '=', 'user_profiles.id')
//            ->where('posts.user_id', $userID)
//            ->get();
//        if (!$userPosts->count())
//            return $this->ApiResponse('', 'No posts added yet', 404);
//        return $this->ApiResponse($userPosts, 'Information returned successfully', 200);
//    }
// now we don't use it
    public  function showMyFollowingPosts()
>>>>>>> 26c08895abfb2d81d91d69ee204fb456c1340dd2
    {
        $userID = Auth::user()->id;
        $userFollowing = userfollowers::where('user_id', $userID)->get();
        $ids = $userFollowing->pluck('user_profile_id')->toArray();
        $finalResult = DB::table('posts')
            ->join('users', 'posts.user_id', '=', 'users.id')
            ->join('user_profiles', 'posts.user_profile_id', '=', 'user_profiles.id')
            ->whereIn('user_profiles.id',$ids)
            ->get();
        if (!$finalResult->count())
            return $this->ApiResponse('', "You haven't follow any user yet", 401);
        return $this->ApiResponse($finalResult, 'Information returned successfully', 200);
    }
    //done
    public function deletePost($id)
    {
        $userID = Auth::user()->id;
        $post = post::where([
            ['user_id', $userID],
            ['id', $id]
        ])->delete();
        return $this->ApiResponse('null', 'Post has been deleted successfully', 200);
    }
    //done
    public function savePost($id)
    {
        $userID = Auth::user()->id;
        $result = savepost::where([
            ['user_id', $userID],
            ['post_id', $id]
        ])->first();
        if (!$result) {
            $save = savepost::create([
                'user_id' => $userID,
                'post_id' => $id,
            ]);
            return $this->ApiResponse('done', 'Post has been saved successfully', 201);
        } else {
            return $this->ApiResponse('', 'Post has already been saved', 422);
        }
    }
    //done
    public function removePostsFromSavedLists($id)
    {
        $userID = Auth::user()->id;
        $result = savepost::where([
            ['user_id', $userID],
            ['post_id', $id]
        ])->delete();
        return $this->ApiResponse('', 'Deleted successfully', 200);
    }

    //not done yet
    public function showSavedPosts()
    {
        $userID = Auth::user()->id;
        $result = savepost::where('user_id', $userID)->get();
        $ids = $result->pluck('post_id')->toArray();
        $finalResult = DB::table('saveposts')
            ->join('posts', 'saveposts.post_id', '=', 'posts.id') //لحتى نجيب معلومات البوست
            ->join('users', 'posts.user_id', '=', 'users.id') //لحتى نجيب اسم صاحب البوست
            ->join('user_profiles', 'posts.user_profile_id', '=', 'user_profiles.id') //لحتى نجيب صورتو
            ->where('saveposts.user_id', $userID)
            ->whereIn('posts.id', $ids)
            ->get();
        return $this->ApiResponse($finalResult, 'Information returned successfully', 200);
    }

    public function promotPost()
    {
    }
    //not done yet
    public function showAllWorldPosts()
    {
        $timeline = post::get();
        $userIds = $timeline->pluck('user_id')->toArray();
        $profileIds = $timeline->pluck('user_profile_id')->toArray();
        $finalResult = DB::table('posts')
            ->join('users', 'posts.user_id', '=', 'users.id')
            ->join('user_profiles', 'posts.user_profile_id', '=', 'user_profiles.id')
            ->where('users.id', $userIds)
            ->where('user_profiles.id', $profileIds)
            ->inRandomOrder()
            ->paginate(100);
        return $this->ApiResponse($finalResult, 'Posts returned successfully', 200);
    }

    public function likePost($id)
    {
        $userID = Auth::user()->id;
        $postInfo = post::where('id', $id)->first();
        $postOwner = $postInfo->user_id;
        $check = like::where([
            ['user_id', $userID],
            ['post_id', $id]
        ])->first();
        if (!$check) {
            $like = like::create([
                'user_id' => $userID,
                'post_id' => $id,
                'post_owner' => $postOwner
            ]);
        }
        $likeCount = like::where('post_id', $id)->count();

        return $this->ApiResponse($likeCount, 'Number of likes', 200);
    }

    public function removeLikeFromPost($id)
    {
        $userID = Auth::user()->id;
        $postLikeInfo = like::where([
            ['user_id', $userID],
            ['post_id', $id]
        ])->delete();
        $likeCount = like::where('post_id', $id)->count();
        if ($postLikeInfo)
            return $this->ApiResponse($likeCount, 'Number of likes', 200);
        return $this->ApiResponse('', '', 400);
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
// postInformationResource::collection
