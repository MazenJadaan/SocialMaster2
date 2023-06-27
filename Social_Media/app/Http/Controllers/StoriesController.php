<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\story;
use App\Models\User_profile;
use Carbon\Carbon;
use App\Http\Resources\showStories;
use App\Models\User;
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
            'story_date' => Carbon::now()->format('Y-m-d'),
            'story_time' => Carbon::now()->addHour(3)->format('H:i'),
            'user_id' => $userID,
            'user_profile_id' => $userID,
        ]);
        return $this->ApiResponse($result, 'Information updated successfully', 201);
    }

    public function addMedia(Request $request)
    {
        $userID = Auth::user()->id;
        $userStory = story::find($userID);
        $data = $request->validate([
            'photo_path' => 'required_without:video_path|image|mimetypes:image/jpeg,image/png,video/mp4',
            'video_path'=>'required_without:photo_path|mimetypes:video/mp4,image/jpeg,image/png',
        ]);
        if ($request->hasFile('photo_path')) {
            $imageName = time() . '.' . $request->file('photo_path')->extension();
            $request->file('photo_path')->storeAs('images/story_picture/', $imageName);
            $name_path = 'storage/app/images/story_picture/' . $imageName;
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
            $request->file('video_path')->storeAs('videos/story_video/', $videoName);
            $name_path = 'storage/app/videos/story_video/' . $videoName;
            $userStory->video_path = $name_path;
            $userStory->save();
        }
    }

    public function showStoryDetail()
    {
        $userID = Auth::user()->id;
        $userStory = story::find($userID);
        $user = showStories::make(story::with('userProfile')->find($userID));
        return $this->ApiResponse($user, 'Information returned susseccfuly', 200);
    }

    public function deleteStory($id)
    {
        $result = story::where('id', $id)->delete();
    }

    public function showStory()
    {
        $userID = Auth::user()->id;
        $user=userfollowers::where('user_id',$userID)->get();
        $ids = $user->pluck('user_profile_id')->toArray();
        $finalResult=story::whereIn('user_profile_id',$ids)->get();
    }
}
