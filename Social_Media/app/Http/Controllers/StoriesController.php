<?php



namespace App\Http\Controllers;



use App\Models\User;
use App\Models\User_profile;
use App\Traits\Save_MediaTrait;
use Illuminate\Support\Facades\Auth;
use App\Models\Story;
use Carbon\Carbon;
use App\Http\Resources\showStories;
use App\Models\userfollowers;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;
use getID3;

class StoriesController extends Controller
{
    use ApiResponseTrait,Save_MediaTrait;
    //done
    public function addStory(Request $request)
    {
        $userID = Auth::user()->id;
        $expireTime = Carbon::now()->addDay()->addHour(3);
        // return $expireTime;
        $data = $request->validate([
            'story_body' => 'required_without:media',
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
                        $story = Story::create([
                            'story_date' => Carbon::now()->format('Y-m-d'),
                            'story_time' => Carbon::now()->format('H:i'),
                            'story_date_expire' => Carbon::now()->addDay(),
                            'user_id' => $userID,
                            'user_profile_id' => $userID,

                        ]);
                        $story->story_body = $data['story_body'];

                        $data = $request->file('media');
                        $save_path = 'videos/stories_videos/' ;
                        $video_name =  $this->save_media($data,$save_path);

                        $story->media = $video_name;
                    }
                }
            } else {
                $story = Story::create([
                    'story_date' => Carbon::now()->format('Y-m-d'),
                    'story_time' => Carbon::now()->format('H:i'),
                    'story_date_expire' => Carbon::now()->addDay(),
                    'user_id' => $userID,
                    'user_profile_id' => $userID,
                ]);

                $story->story_body = $data['story_body'];


                $data = $request->file('media');
                $save_path = 'images/stories_pictures/' ;
                $pic_name =  $this->save_media($data,$save_path);

                $story->media = $pic_name;
            }
            $story->save();
            return $this->ApiResponse($story, 'Information updated successfully', 201);
        } elseif ($hastext) {
            $story = Story::create([
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
                        $story = Story::create([
                            'story_date' => Carbon::now()->format('Y-m-d'),
                            'story_time' => Carbon::now()->format('H:i'),
                            'story_date_expire' => Carbon::now()->addDay(),
                            'user_id' => $userID,
                            'user_profile_id' => $userID,
                        ]);

                        $data = $request->file('media');
                        $save_path = 'videos/stories_videos/' ;
                        $video_name =  $this->save_media($data,$save_path);
                        $story->media = $video_name;

                        $story->save();
                    }
                }
            } else {
                $story = Story::create([
                    'story_date' => Carbon::now()->format('Y-m-d'),
                    'story_time' => Carbon::now()->format('H:i'),
                    'story_date_expire' => Carbon::now()->addDay(),
                    'user_id' => $userID,
                    'user_profile_id' => $userID,
                ]);

                $data = $request->file('media');
                $save_path = 'images/stories_pictures/' ;
                $pic_name =  $this->save_media($data,$save_path);


                $story->media = $pic_name;

                $story->save();
            }
            return $this->ApiResponse($story, 'Information updated successfully', 201);
        } else {
            return $this->ApiResponse('', 'Please provide either story or media', 400);
        }
    }
    //done

    public function deleteStory($id)
    {
           $current_user = Auth::id();
       $my_story= Story::select('user_id')->where('id',$id)->value('user_id');
        if($current_user == $my_story) {
            $result = Story::where('id', $id)->delete();
            return $this->ApiResponse('', 'Story deleted susseccfuly', 200);

        }
        else {
            return $this->ApiResponse('','this not your story you cant delete her',400);
        }
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
        $data = [
           'my_info' => $user ,
          'my_stories' =>  $user_stories
        ];
        return $this->ApiResponse($data, 'Information returned susseccfuly', 200);
    }
    //done

    public function showStory()
    {
     // $expireTime = Carbon::now();
        $userID = Auth::user()->id;
        $userFollowing = userfollowers::where('user_id', $userID)->get();
        $ids = $userFollowing->pluck('user_profile_id')->toArray();
        $finalResult= User::select('id','first_name','last_name')->whereIn('id',$ids)->with(['user_profile'=>function($q){
            $q->select('user_id','profile_photo');
       }])->with(['story'=>function($q1){
           $expireTime = Carbon::now();
            $q1 ->where('story_date_expire', '>', $expireTime);
        }])->get();
      /* $finalResult = showStories::collection(story::whereIn('user_profile_id', $ids)
         ->where('story_date_expire', '>', $expireTime)
            ->get());*/
      return   $this->ApiResponse($finalResult, 'Information returned susseccfuly', 200);
    }

    //done
    public function showArchiveStories()
    {
        $userID = Auth::user()->id;
        $userStory = Story::where('user_id', $userID)->get();
        return $this->ApiResponse($userStory, 'Information returned susseccfuly', 200);
    }
    //done
}
