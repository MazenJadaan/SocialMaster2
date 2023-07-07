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
        $result = Post::where('body', 'like', '%' . $keyword . '%')
            ->get();
        if (!$result->count()) {
            return $this->ApiResponse('', 'Posts not found', 404);
        }
        return $this->ApiResponse($result, 'Posts found', 200);
    }
}
