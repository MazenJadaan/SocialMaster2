<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\story;
use App\Models\User_profile;
use Carbon\Carbon;
use App\Http\Resources\showStories;
use App\Models\userfollowers;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class StoriesController extends Controller
{
    use ApiResponseTrait;
    public function addStory(Request $request)
    {
        $userID = Auth::user()->id;
        $data = $request->validate([
            'story_body' => 'required|string',
        ]);

        $result = story::create([
            'story_body' => $data['story_body'],
            'story_date' => Carbon::now()->format('m/d'),
            'story_time' => Carbon::now()->format('H:i'),
            'user_id' => $userID->id,
            // 'user_profile_id' => $userID->id,
        ]);
        return $this->ApiResponse($result, 'Information updated successfully', 201);
    }

    public function addPhoto(Request $request)
    {
        $userID = Auth::user()->id;
        $userStory = story::find($userID);
        $data = $request->validate([
            'photo_path' => 'image|mimes:jpg,jpeg',
        ]);
        if ($request->hasFile('photo_path')) {
            $imageName = time() . '.' . $request->file('photo_path')->extension();
            $request->file('photo_path')->storeAs('images/photo_path/', $imageName);
            $name_path = 'storage/app/images/photo_path/' . $imageName;
            $userStory->photo_path = $name_path;
            $userStory->save();
        }
    }

    public function addVideo(Request $request)
    {
        $userID = Auth::user()->id;
        $userStory = story::find($userID);
        $data = $request->validate([
            'video_path' => 'video',
        ]);
        if ($request->hasFile('video_path')) {
            $videoName = time() . '.' . $request->file('video_path')->extension();
            $request->file('video_path')->storeAs('images/video_path/', $videoName);
            $name_path = 'storage/app/images/video_path/' . $videoName;
            $userStory->video_path = $name_path;
            $userStory->save();
        }
    }

    public function deleteStory($id)
    {
        $result = story::where('id', $id)->delete();
    }

    public function showStory($id)
    {

        $userID = Auth::user()->id;
        $search=userfollowers::where([
        ['user_id',$userID],
        ['user_id',$userID],
        ]);
        // $user = showStories::collection(User_profile::find($userID));
    }
}
