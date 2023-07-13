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
            ->join('user_profiles', 'users.id', '=', 'user_id')
            ->whereIn('users.id', $ids)
            ->select('first_name', 'last_name', 'profile_photo')
            ->get();
        return $this->ApiResponse($finalResult, 'Users found', 200);
    }

    public function searchIntoPosts(Request $request)
    {
        $keyword = $request->name;
        if(!$keyword)
            return $this->ApiResponse('','KeyWord is missing',400);
        $result = Post::where('post_body', 'like', '%' . $keyword . '%')
            ->get();    
        if(!$result->count())
            return $this->ApiResponse('','posts not found',400);
        $usersIds=$result->pluck('user_id')->toArray();
        $postId=$result->pluck('id')->toArray();
        $finalResult=DB::table('posts')
            ->join('users','posts.user_id','=','users.id')
            ->join('user_profiles','posts.user_profile_id','=','user_profiles.id')
            ->whereIn('users.id',$usersIds)
            ->whereIn('posts.id',$postId)
            ->get();
        return $this->ApiResponse($finalResult, 'Posts found', 200);
    }
}

