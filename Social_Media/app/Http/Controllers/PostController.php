<?php

namespace App\Http\Controllers;

use App\Http\Resources\postInformationResource;
use App\Models\comment;
use App\Models\like;
use App\Models\Post;
use App\Models\savepost;
use App\Models\sharepost;
use App\Models\User;
use App\Models\User_profile;
use App\Models\userfollowers;
use App\Notifications\LikePost;
use App\Notifications\CommentOnPost;
use App\Traits\Save_MediaTrait;
use Carbon\Carbon;
use Database\Factories\User_profileFactory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class PostController extends Controller
{
    use ApiResponseTrait, Save_MediaTrait;
    //dont know if done or not yet
    public function createNewPost(Request $request)
    {
        $userID = Auth::user()->id;

        if ($request->hasFile('image') && $request->hasFile('video')) {
            return "the post cannot contain video and image Either a photo or a video";
        } elseif ($request->hasFile('video') && empty($request->input('image'))) {
            //                $data = $request->validate([
            //                    'post_body' => 'string',
            //                ]);

            $data = $request->file('video');
            $save_path = 'videos/posts_videos/';
            $video_name =  $this->save_media($data, $save_path);



            $post = Post::create([
                'user_id' => $userID,
                'user_profile_id' => $userID,
                'post_time' => Carbon::now()->format('H:i:s'),
                'post_date' => Carbon::now()->format('Y-m-d'),
                'post_video' => $video_name
            ]);
            if ($request->input('post_body')) {
                $post->post_body =  $request->input('post_body');
                $post->save();
            }
            $postResult = [
                'post' => postInformationResource::make($post),
                'post_video' => $video_name
            ];
            return $this->ApiResponse($postResult, 'post created its successful', 200);
        } elseif ($request->hasFile('image') && empty($request->input('video'))) {

            $post = Post::create([
                'user_id' => $userID,
                'user_profile_id' => $userID,
                'post_time' => Carbon::now()->format('H:i:s'),
                'post_date' => Carbon::now()->format('Y-m-d'),
            ]);
            if ($request->input('post_body')) {
                $post->post_body =  $request->input('post_body');
                $post->save();
            }

            $images = array();
            $files = $request->file('image');

            foreach ($files as $file) {
                $image_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $image_full_name = $image_name . '.' . $ext;
                $upload_path = public_path('/images/posts_pictures/');
                $file->move($upload_path, $image_full_name);
                $img_url = 'images/posts_pictures/' . $image_full_name;
                $images[] = $img_url;
            }
            foreach ($images as $image) {
                $post->photo()->create([
                    'post_id' => $post->id,
                    'photo_path' => $image
                ]);
            }

            $postResult = [
                'post' => postInformationResource::make($post),
                'post_images' => $post->photo
            ];
            return $this->ApiResponse($postResult, 'post created its successful', 200);
        } elseif (empty($request->input('video')) && empty($request->input('image'))) {
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
            $data = ['post' => $postResult];
            return $this->ApiResponse($data, 'post created its successful', 200);
        }
    }

    public function editUpdatePost(Request $request, $post_id)
    {
        $user_id = Auth::id();
        $post = Post::find($post_id);
        if ($post->user_id != $user_id) {
            return response()->json(['you cannot edit or update this post because is not your post ']);
        } else {
            $post->photo()->delete();
            $post->post_video = null;
            $post->post_body = null;

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
                $postResult = [
                    'post' => postInformationResource::make($post),
                    'post_video' => $video_name
                ];
                return $this->ApiResponse($postResult, 'post update its successful', 200);
            } elseif ($request->hasFile('image') && empty($request->input('video'))) {

                if ($request->input('post_body')) {
                    $newbody = $request->input('post_body');
                    $post->update(['post_body' => $newbody]);
                    $post->save();
                }
                $images = array();
                $files = $request->file('image');

                foreach ($files as $file) {
                    $image_name = md5(rand(1000, 10000));
                    $ext = strtolower($file->getClientOriginalExtension());
                    $image_full_name = $image_name . '.' . $ext;
                    $upload_path = public_path('/images/posts_pictures/');
                    $file->move($upload_path, $image_full_name);
                    $img_url = 'images/posts_pictures/' . $image_full_name;
                    $images[] = $img_url;
                }
                foreach ($images as $image) {
                    $post->photo()->create([
                        'post_id' => $post->id,
                        'photo_path' => $image
                    ]);
                }
                $postResult = [
                    'post' => postInformationResource::make($post),
                    'post_images' => $post->photo
                ];
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
        if ($post->user_id != $user_id) {
            return response()->json(['you cannot delete this post because is not your post ']);
        } else {
            $post->delete();
            return $this->ApiResponse('null', 'Post has been deleted successfully', 200);
        }
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
        $result = savepost::where('user_id', $userID)
            ->with('post', function ($q) {
                $q->withCount(['like', 'comment', 'sharePost'])
                    ->with('photo', function ($q) {
                        $q->select('post_id', 'photo_path');
                    })
                    ->with('user', function ($q1) {
                        $q1->select(['id', 'first_name', 'last_name'])
                            ->with('user_profile', function ($query) {
                                $query->select(['user_id', 'profile_photo']);
                            });
                    });
            })
            ->get()->makeHidden(['created_at', 'updated_at', 'post_id', 'user_id']);
        if (count($result))
            return $this->ApiResponse($result, 'My Saved Post returned successfully', 200);
        return $this->ApiResponse(null, 'You Don\'t Have Any Saved Post ', 200);
    }

    public function promotPost()
    {
    }
    //not done yet


    public function likePost($id)
    {
        $userID = Auth::user()->id;
        $userAuthenticated = User::find($userID);
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
            $postOwnerUser = User::find($postOwner);
            $postOwnerUser->notify(new LikePost($userAuthenticated->first_name, "Liked Your Post", $postInfo->post_body));
        }
        return $this->ApiResponse('Done', 'React With Post By Put Like is Successful ', 200);
    }


    public function removeLikeFromPost($id)
    {
        $userID = Auth::user()->id;
        $postLikeInfo = like::where([
            ['user_id', $userID],
            ['post_id', $id]
        ])->delete();
        return $this->ApiResponse('Done', 'UnLike for This Post  is Successful', 200);
    }

    public function showAllReacts($PostID)
    {
        $Reacts = like::select('id', 'user_id')->where('post_id', $PostID)->with('user', function ($q) {
            $q->select('id', 'first_name', 'last_name')
                ->with('user_profile', function ($q1) {
                    $q1->select('user_id', 'profile_photo');
                });
        })->get()->makeHidden(['user_id']);
        if (count($Reacts) > 0)
            return $this->ApiResponse($Reacts, 'This All Reacts On This Post', 200);
        return $this->ApiResponse(null, 'There Are No Reacts Yet ', 400);
    }

    public function commentOnPost(Request $request, $PostID)
    {
        $MyID = Auth::id();
        $user = User::select('first_name','last_name')->find($MyID);
        $user_profile = User_profile::select('profile_photo')->find($MyID);
        $postInfo = post::where('id', $PostID)->first();
        $owner_id = Post::where('id', $PostID)->value('user_id');
        $text = $request->validate([
            'comment' => 'required|String'
        ]);

        $comment = comment::Create([
            'user_id' => $MyID,
            'post_id' => $PostID,
            'comment' => $text['comment'],
            'post_owner' => $owner_id
        ]);
        $postOwner = User::find($owner_id);
        $userAuthenticated = User::find($MyID);
        $postOwner->notify(new CommentOnPost($userAuthenticated->first_name, 'Comment on your post', $postInfo->post_body,$comment->comment));
        $info = [
            'user_name' => $user,
            'profile_photo' => $user_profile,
            'comment_info' => $comment
        ];
        return  $this->ApiResponse($info, 'write your comment in this post successfuly', 200);
    }

    public function deleteComment($CommentID)
    {
        $myID = Auth::id();
        $UserIdOfComment = comment::where('id', $CommentID)->value('user_id');
        $post_owner_id = comment::where('id', $CommentID)->value('post_owner');
        if ($myID != $UserIdOfComment && $myID != $post_owner_id) {
            if ($myID != $UserIdOfComment) {
                return $this->ApiResponse(null, 'this not your comment you can\'t delete him', 400);
            }
            return $this->ApiResponse(null, 'this comment not in your post you can\'t delete him', 400);
        } else {
            comment::where('id', $CommentID)->delete();
            return  $this->ApiResponse(null, 'delete comment is successfuly', 400);
        }
    }

    public function showAllComments($PostID)
    {
        $AllComments = comment::select('id', 'comment', 'user_id', 'created_at')->where('post_id', $PostID)->with('user', function ($q) {
            $q->select('id', 'first_name', 'last_name');
            $q->with('user_profile', function ($q1) {
                $q1->select('user_id', 'profile_photo');
            });
        })->orderBy('created_at', 'desc')->get();
        return $this->ApiResponse($AllComments, 'all the comments on this post', 200);
    }

    public function sharePost(Request $request, $PostID)
    {
        $MyID = Auth::id();
        $text = $request->validate([
            'body' => 'required|String'
        ]);

        $SharePost = Sharepost::create([
            'user_id' => $MyID,
            'post_id' => $PostID,
            'body' => $text['body'],
            'share_time' => Carbon::now()->format('H:i:s'),
            'share_date' => Carbon::now()->format('Y-m-d'),
        ]);

        return $this->ApiResponse($SharePost, 'Share Post Is Successfully', 200);
    }

    public function showSharedPosts($PostID)
    {
        $Shares = sharepost::where('post_id', $PostID)->with('user', function ($q) {
            $q->select('id', 'first_name', 'last_name')
                ->with('user_profile', function ($q1) {
                    $q1->select('user_id', 'profile_photo');
                });
        })->orderBy('created_at', 'desc')->get()->makeHidden(['created_at', 'updated_at']);
        return $this->ApiResponse($Shares, 'this all shares of this post', 200);
    }

    public function deleteSharedPost($SharePostID)
    {
        $MyID = Auth::id();
        $MySharePost = sharepost::where('id', $SharePostID)->value('user_id');
        if ($MyID != $MySharePost) {
            return $this->ApiResponse('Failed', 'You Can\'t Delete This Shared Post Because not your post', 400);
        }
        sharepost::where('id', $SharePostID)->delete();
        return $this->ApiResponse('Done', 'The Shared Post Is Deleted', 200);
    }
}
// 'photo_path' => 'image' | 'mimes:jpg,bmp,png,jpeg',
// 'video_path' => 'mimetypes:video/avi,video/mpeg,video/quicktime'
// postInformationResource::collection
