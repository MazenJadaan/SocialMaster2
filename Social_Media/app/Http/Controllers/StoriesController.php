<?php



namespace App\Http\Controllers;



use Illuminate\Support\Facades\Auth;
use App\Models\story;
use Carbon\Carbon;
use App\Http\Resources\showStories;
use App\Models\userfollowers;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;
use getID3;

class StoriesController extends Controller
{
    use ApiResponseTrait;
    //done
    public function addStory(Request $request)
    {
        $userID = Auth::user()->id;
        $expireTime = Carbon::now()->addDay()->addHour(3);
        // return $expireTime;
        $data = $request->validate([
            'story_body' => 'required_without:media|string',
            'media' => 'required_without:story_body|file|mimetypes:image/jpeg,image/png,video/mp4',
        ]);
        $hastext = $request->has('story_body');
        $hasmedia = $request->has('media');
        if ($hastext && $hasmedia) {
            $file = $request->file('media');
            $mediaType = $file->getMimeType();
            $getID3 = new getID3;
            if (strpos($mediaType, 'video') !== false) {
                $video = $getID3->analyze($request->file('media'));
                if (isset($video['playtime_seconds'])) {
                    if ($video['playtime_seconds'] > 30) {
                        return $this->ApiResponse('', "Can't post videos longer than 30 sec", 401);
                    } else {
                        $story = story::create([
                            'story_date' => Carbon::now()->format('Y-m-d'),
                            'story_time' => Carbon::now()->format('H:i'),
                            'story_date_expire' => Carbon::now()->addDay(),
                            'user_id' => $userID,
                            'user_profile_id' => $userID,
                        ]);
                        $story->story_body = $data['story_body'];
                        $videoName = time() . '.' . $request->file('media')->extension();
                        $request->file('media')->storeAs('images/story_media/', $videoName);
                        $name_path = 'storage/app/images/story_media/' . $videoName;
                        $story->media = $name_path;
                    }
                }
            } else {
                $story = story::create([
                    'story_date' => Carbon::now()->format('Y-m-d'),
                    'story_time' => Carbon::now()->format('H:i'),
                    'story_date_expire' => Carbon::now()->addDay(),
                    'user_id' => $userID,
                    'user_profile_id' => $userID,
                ]);
                $story->story_body = $data['story_body'];
                $imageName = time() . '.' . $request->file('media')->extension();
                $request->file('media')->storeAs('images/story_media/', $imageName);
                $name_path = 'storage/app/images/story_media/' . $imageName;
                $story->media = $name_path;
            }
            $story->save();
            return $this->ApiResponse($story, 'Information updated successfully', 201);
        } elseif ($hastext) {
            $story = story::create([
                'story_date' => Carbon::now()->format('Y-m-d'),
                'story_time' => Carbon::now()->format('H:i'),
                'story_date_expire' => Carbon::now()->addDay(),
                'user_id' => $userID,
                'user_profile_id' => $userID,
            ]);
            $story->story_body = $data['story_body'];
            $story->save();
            return $this->ApiResponse($story, 'Information updated successfully', 201);
        } elseif ($hasmedia) {
            $file = $request->file('media');
            $mediaType = $file->getMimeType();
            $getID3 = new getID3;
            if (strpos($mediaType, 'video') !== false) {
                $video = $getID3->analyze($request->file('media'));
                if (isset($video['playtime_seconds'])) {
                    if ($video['playtime_seconds'] > 30) {
                        return $this->ApiResponse('', "Can't post videos longer than 30 sec", 401);
                    } else {
                        $story = story::create([
                            'story_date' => Carbon::now()->format('Y-m-d'),
                            'story_time' => Carbon::now()->format('H:i'),
                            'story_date_expire' => Carbon::now()->addDay(),
                            'user_id' => $userID,
                            'user_profile_id' => $userID,
                        ]);
                        $videoName = time() . '.' . $request->file('media')->extension();
                        $request->file('media')->storeAs('images/story_media/', $videoName);
                        $name_path = 'storage/app/images/story_media/' . $videoName;
                        $story->media = $name_path;
                        $story->save();
                    }
                }
            } else {
                $story = story::create([
                    'story_date' => Carbon::now()->format('Y-m-d'),
                    'story_time' => Carbon::now()->format('H:i'),
                    'story_date_expire' => Carbon::now()->addDay(),
                    'user_id' => $userID,
                    'user_profile_id' => $userID,
                ]);
                $imageName = time() . '.' . $request->file('media')->extension();
                $request->file('media')->storeAs('images/story_media/', $imageName);
                $name_path = 'storage/app/images/story_media/' . $imageName;
                $story->media = $name_path;
                $story->save();
            }
            return $this->ApiResponse($story, 'Information updated successfully', 201);
        } else {
            return $this->ApiResponse('', 'Please provide either story or media', 400);
        }
    }
    //done
    public function showStoryDetail()
    {
        $expireTime = Carbon::now();
        $userID = Auth::user()->id;
        $user = showStories::collection(story::with('userProfile')->where([
            ['user_id', $userID],
            ['story_date_expire', '>', $expireTime],
        ])->get());
        return $this->ApiResponse($user, 'Information returned susseccfuly', 200);
    }
    //done
    public function deleteStory($id)
    {
        $result = story::where('id', $id)->delete();
        return $this->ApiResponse('', 'Story deleted susseccfuly', 200);
    }
    //done
    public function showArchiveStories()
    {
        $userID = Auth::user()->id;
        $userStory = story::where('user_id', $userID)->get();
        return $this->ApiResponse($userStory, 'Information returned susseccfuly', 200);
    }
    //done
    public function showStory()
    {
        $expireTime = Carbon::now();
        $userID = Auth::user()->id;
        $user = userfollowers::where('user_id', $userID)->get();
        $ids = $user->pluck('user_profile_id')->toArray();
        $finalResult = showStories::collection(story::whereIn('user_profile_id', $ids)
            ->where('story_date_expire', '>', $expireTime)
            ->get());
        return $this->ApiResponse($finalResult, 'Information returned susseccfuly', 200);
    }
}
