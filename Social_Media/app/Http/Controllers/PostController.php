<?php

namespace App\Http\Controllers;

use App\Http\Resources\postInformationResource;
use App\Models\like;
use App\Models\Post;
use App\Models\savepost;
use App\Models\userfollowers;
use App\Traits\Save_MediaTrait;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class PostController extends Controller
{
    use ApiResponseTrait,Save_MediaTrait;
    //dont know if done or not yet
    public function createNewPost(Request $request)
    {
        $userID = Auth::user()->id;

        if($request->hasFile('image') && $request->hasFile('video')){
            return "the post cannot contain video and image Either a photo or a video";
        }

        elseif ($request->hasFile('video') && empty($request->input('image'))) {
//                $data = $request->validate([
//                    'post_body' => 'string',
//                ]);

            $data = $request->file('video');
            $save_path = 'videos/posts_videos/' ;
            $video_name =  $this->save_media($data,$save_path);



                $post = Post::create([
                    'user_id' => $userID,
                    'user_profile_id' => $userID,
                    'post_time' => Carbon::now()->format('H:i:s'),
                    'post_date' => Carbon::now()->format('Y-m-d'),
                    'post_video' => $video_name
                ]);
                if($request->input('post_body')) {
                    $post->post_body =  $request->input('post_body');
                    $post->save();
            }
                $postResult = ['post' => postInformationResource::make($post),
                    'post_video' => $video_name];
                return $this->ApiResponse($postResult, 'post created its successful', 200);
            }



        elseif ($request->hasFile('image') && empty($request->input('video'))) {

            $post = Post::create([
                'user_id' => $userID,
                'user_profile_id' => $userID,
                'post_time' => Carbon::now()->format('H:i:s'),
                'post_date' => Carbon::now()->format('Y-m-d'),
            ]);
            if($request->input('post_body')) {
                $post->post_body =  $request->input('post_body');
                $post->save();
            }

            $images = $request->file('image');
           foreach ($images as $img){
               $save_path = 'images/posts_pictures/' ;
               $pic_name =  $this->save_media($img,$save_path);
                $post->photo()->create(['post_id'=> $post->id,
                    'photo_path'=>$pic_name]);

         }
            $postResult = ['post' => postInformationResource::make($post),
                'post_images' => $post->photo];
            return $this->ApiResponse($postResult, 'post created its successful', 200);
        }
        elseif (empty($request->input('video')) && empty($request->input('image'))){
                $data = $request->validate([
                    'post_body' => 'string|required',
                ]);

                $post = Post::create([
                    'user_id' => $userID,
                    'user_profile_id' => $userID,
                    'post_body' => $data['post_body'],
                    'post_time' => Carbon::now()->format('H:i:s'),
                    'post_date' => Carbon::now()->format('Y-m-d'),
                ]);
                $postResult = postInformationResource::make($post);
                $data = [ 'post' => $postResult ] ;
                return $this->ApiResponse($data, 'post created its successful', 200);
            }


    }

    public function editUpdatePost(Request $request,$post_id)
    {
        $user_id = Auth::id();
        $post = Post::find($post_id);
        if($post->user_id!=$user_id){
            return response()->json(['you cannot edit or update this post because is not your post ']);
        }
        else {
            $post->photo()->delete();
            $post->post_video=null;
               $post->post_body=null;

            if ($request->hasFile('image') && $request->hasFile('video')) {
                return "the post cannot contain video and image Either a photo or a video";
            } elseif ($request->hasFile('video') && empty($request->input('image'))) {
                $data = $request->file('video');
                $save_path = 'videos/posts_videos/';
                $video_name = $this->save_media($data, $save_path);

                $post->update([
                    'post_video' => $video_name
                ]);
                if ($request->input('post_body')) {
                    $newbody = $request->input('post_body');
                    $post->update([
                        'post_body' => $newbody
                    ]);
                }
                $post->save();
                $postResult = ['post' => postInformationResource::make($post),
                    'post_video' => $video_name];
                return $this->ApiResponse($postResult, 'post update its successful', 200);
            } elseif ($request->hasFile('image') && empty($request->input('video'))) {

                if ($request->input('post_body')) {
                    $newbody = $request->input('post_body');
                    $post->update(['post_body' => $newbody]);
                    $post->save();
                }
                $images = $request->file('image');
                foreach ($images as $img) {
                    $save_path = 'images/posts_pictures/';
                    $pic_name = $this->save_media($img, $save_path);
                    $post->photo()->create(['post_id' => $post->id,
                        'photo_path' => $pic_name]);
                }
                $postResult = ['post' => postInformationResource::make($post),
                    'post_images' => $post->photo];
                return $this->ApiResponse($postResult, 'post updated its successful', 200);

            } elseif (empty($request->input('video')) && empty($request->input('image'))) {
                $data = $request->validate([
                    'post_body' => 'string|required',
                ]);

                $post->update(['post_body' => $data['post_body']]);
                $postResult = postInformationResource::make($post);
                return $this->ApiResponse($postResult, 'post updated its successful', 200);
            }
            $post->save();

        }

    }
    public function deletePost($post_id)
    {
        $user_id = Auth::id();
        $post = Post::find($post_id);
        if($post->user_id!=$user_id){
            return response()->json(['you cannot delete this post because is not your post ']);
        }
        else {
          $post->delete();
            return $this->ApiResponse('null', 'Post has been deleted successfully', 200);
        }
    }

    public function showAllWorldPosts()
    {
        $timeline = Post::get();
        $userIds = $timeline->pluck('user_id')->toArray();
        $profileIds = $timeline->pluck('user_profile_id')->toArray();
        $finalResult = DB::table('posts')
            ->join('photos', 'posts.id', '=', 'photos.post_id')
            ->join('users', 'posts.user_id', '=', 'users.id')
            ->join('user_profiles', 'posts.user_profile_id', '=', 'user_profiles.id')
            ->select('posts.*','photos.photo_path','users.first_name','users.last_name','user_profiles.profile_photo')
            ->where('users.id', $userIds)
            ->where('user_profiles.id', $profileIds)
            ->get();
        return $this->ApiResponse($finalResult, 'Posts returned successfully', 200);
    }





    public  function showMyFollowingPosts()
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


    public function likePost($id)
    {
        $userID = Auth::user()->id;
        $postInfo = Post::where('id', $id)->first();
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
