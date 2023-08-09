<?php

namespace App\Http\Controllers\HomePage;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SeeController extends Controller
{
    use ApiResponseTrait;
    public  function  see_videos(){
        $myId = Auth::id();
        $videos = Post::where('user_id','!=',$myId)->whereNotNull('post_video')->withCount(['like','comment','sharePost'])->with('user',function($q){
            $q->select(['id','first_name','last_name'])->with('user_profile',function ($query){
                $query->select(['user_id','profile_photo']);
            });
        })
        ->orderBy('created_at', 'desc')->get()->makeHidden(['user_id','user_profile_id','updated_at']);
        return $this->ApiResponse($videos,'all the videos',200);
    }
}
