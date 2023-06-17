<?php

namespace App\Http\Controllers;

use App\Http\Resources\showSearchResult;
use App\Models\post;
use App\Models\User;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    use ApiResponseTrait;
    public function searchIntoUsers()
    {
        $name = request()->query('name');
        $result = User::where('first_name', 'like', '%' . $name . '%')
            ->orWhere('last_name', 'like', '%' . $name . '%')->get();
        // $result = User::where('full_name', 'like', '%' . $name . '%')->get();
        if ($result->count() > 0) {
            return $this->ApiResponse($result, '', 200);
        }
        // $result1=showSearchResult::collection(User::with('user_profile'));
        return $this->ApiResponse($result, 'There is no users with this name', 404);
    }

    public function searchIntoPosts()
    {
        $text = request()->query('text');
        return post::where('body', 'like', '%' . $text . '%')->get();
    }
}
