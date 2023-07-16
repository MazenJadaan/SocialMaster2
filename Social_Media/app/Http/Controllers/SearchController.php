<?php

namespace App\Http\Controllers;

use App\Models\post;
use App\Models\User;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SearchController extends Controller
{
    use ApiResponseTrait;

    public function searchIntoUsers(Request $request)
    {
        $keyword = $request->name;
        if(!$keyword)
            return $this->ApiResponse('','KeyWord is missing',400);
        $result = User::where('first_name', 'like', '%' . $keyword . '%')
            ->orWhere('last_name', 'like', '%' . $keyword . '%')
            ->get();
        if (!$result->count()) {
            return $this->ApiResponse('', 'Users not found', 404);
        }
        $ids = $result->pluck('id')->toArray();
        $finalResult = DB::table('users')
            ->Join('user_profiles', 'users.id', '=', 'user_id')
            ->whereIn('users.id', $ids)
            ->select('id','first_name', 'last_name', 'profile_photo')
            ->get();
        return $this->ApiResponse($finalResult, 'Users found', 200);
    }

    public function searchIntoPosts(Request $request)
    {
        $keyword = $request->text;
        if(!$keyword)
            return $this->ApiResponse('','KeyWord is missing',400);
        $result = Post::select('id','user_id','post_body','post_time','post_date')
            ->where('post_body', 'like', '%' . $keyword . '%')
            ->with(['Photo'=>function($q){
                $q->select('post_id','photo_path');
            }])
            ->with(['Video'=>function($q1){
        $q1->select('post_id','video_path');
            }])
            ->with(['user'=>function($q2){
                $q2->select('id','first_name','last_name')->with(['user_profile'=>function($q3){
                    $q3->select('user_id','profile_photo');
                }]);
            }])
            ->get();
        if(!$result->count())
            return $this->ApiResponse('','posts not found',400);

//        $usersIds=$result->pluck('user_id')->toArray();
//        $postId=$result->pluck('id')->toArray();
//        $finalResult=DB::table('posts')
//            ->join('photos','posts.id','=','photos.post_id')
//
//            ->join('users','posts.user_id','=','users.id')
//            ->join('user_profiles','posts.user_profile_id','=','user_profiles.id')
//            ->whereIn('users.id',$usersIds)
//            ->whereIn('posts.id',$postId)
//            ->get();
        return $this->ApiResponse($result, 'Posts found', 200);
    }
}

