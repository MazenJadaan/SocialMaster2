<?php

namespace App\Http\Controllers\HomePage;

use App\Http\Controllers\Controller;
use App\Http\Resources\showStories;
use App\Models\payedposts;
use App\Models\Post;
use App\Models\Story;
use App\Models\User;
use App\Models\userfollowers;
use App\Traits\ApiResponseTrait;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SeeAndHomePageController extends Controller
{
    use ApiResponseTrait;
    public  function  see_videos(){
        $myId = Auth::id();
        $videos = Post::where('user_id','!=',$myId)->whereNotNull('post_video')->withCount(['like','comment','sharePost'])
            ->with('user',function($q){
            $q->select(['id','first_name','last_name'])->with('user_profile',function ($query){
                $query->select(['user_id','profile_photo']);
            });
        })
        ->orderBy('created_at', 'desc')->get()->makeHidden(['user_id','user_profile_id','updated_at','created_at']);
        return $this->ApiResponse($videos,'all the videos',200);
    }

    public function showAllWorldPosts()
    {
        $myId = Auth::id();
        $finalResult = Post::where('user_id','!=',$myId)->withCount(['like','comment','sharePost'])
            ->with('photo',function ($q){
                $q->select('post_id','photo_path');
            })
            ->with('user',function($q1){
                $q1->select(['id','first_name','last_name'])->with('user_profile',function ($query){
                    $query->select(['user_id','profile_photo']);
                });
            })
            ->orderBy('created_at', 'desc')->get()->makeHidden(['user_id','user_profile_id','updated_at','created_at']);
        return $this->ApiResponse($finalResult, 'Posts returned successfully', 200);
    }
    public  function showMyFollowingPosts()
    {
      $userID = Auth::id();
        $userFollowing = userfollowers::where('user_id', $userID)->get();
        $ids = $userFollowing->pluck('user_profile_id')->toArray();

       $AllPosts = Post::whereIn('user_id',$ids)->withCount(['like','comment','sharePost'])
               ->with('photo',function ($q){
                   $q->select('post_id','photo_path');
               })
               ->with('user',function($q1){
                   $q1->select(['id','first_name','last_name'])->with('user_profile',function ($query){
                       $query->select(['user_id','profile_photo']);
                   });
               });


        $PromtionPosts = Post::whereHas('payedPost',function (Builder $q){
            $userID = Auth::id();
            $q->where('user_id','!=',$userID);
        })->with('payedPost',function ($q1){
            $q1->select('post_id','promtion_time');
        })->withCount(['like','comment','sharePost'])
            ->with('photo',function ($q){
                $q->select('post_id','photo_path');
            })
            ->with('user',function($q1){
                $q1->select(['id','first_name','last_name'])->with('user_profile',function ($query){
                    $query->select(['user_id','profile_photo']);
                });})->union($AllPosts)->orderBy('created_at','desc')->get();
//
        if (!$PromtionPosts->count())
            return $this->ApiResponse('', "You haven't follow any user yet and not exits any post", 401);
        return $this->ApiResponse($PromtionPosts, 'Information returned successfully', 200);
    }


    public function showMyStoryDetail()
    {
        $expireTime = Carbon::now();
        $userID = Auth::user()->id;
        $user = User::select('id','first_name','last_name')->where('id',$userID)->with(['user_profile'=>function($q){
            $q->select('id','user_id','profile_photo');
        }])->get();
        $user_stories = showStories::collection(Story::where([
            ['user_id', $userID],
            ['story_date_expire', '>', $expireTime],
        ])->get());
        if(count($user_stories)) {
            $data = [
                'my_info' => $user,
                'my_stories' => $user_stories
            ];

            return $this->ApiResponse($data, 'My Stories returned successful', 200);
        }
        return $this->ApiResponse('null', 'You Dont have Stories Active You Can Create One', 402);

    }
    //done

    public function showStory()
    {
        // $expireTime = Carbon::now();
        $userID = Auth::user()->id;
        $userFollowing = userfollowers::where('user_id', $userID)->get();
        $ids = $userFollowing->pluck('user_profile_id')->toArray();

//        $exist_story = Story::whereIn('user_id',$ids)->
        $finalResult= User::select('id','first_name','last_name')
            ->where('id','!=',$userID)
            ->whereIn('id',$ids)
            ->whereHas('story',function ($query){
                $expireTime = Carbon::now();
                $query->where('story_date_expire', '>', $expireTime);
            })
            ->with(['user_profile'=>function($q){
            $q->select('user_id','profile_photo');
        }])
            ->with(['story'=>function($q1){
            $expireTime = Carbon::now();
            $q1 ->where('story_date_expire', '>', $expireTime);
        }])
            ->get();
if(count($finalResult)>0) {
    return $this->ApiResponse($finalResult, 'All Stories Of Your Following User\'s returned susseccfuly', 200);
}
        return   $this->ApiResponse(null, 'There are no stories available now. ', 200);

    }

    //done

}
