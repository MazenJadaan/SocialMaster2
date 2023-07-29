<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Post extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'user_profile_id',
        'post_body',
        'post_time',
        'post_date',
        'post_video',
        'reaction',
        'saved'
    ];

    public function getReactionAttribute($value)
    {
        $user_id = Auth::id();
         $post_id = $this->id;
              $react= like::where('user_id',$user_id)->where('post_id',$post_id)->get();
        if(count($react)>0){
            return 1;
        }
        else {
            return 0;
        }
    }

    public function getSavedAttribute($value){
        $user_id = Auth::id();
        $post_id = $this->id;
        $saved= savepost::where('user_id',$user_id)->where('post_id',$post_id)->get();
        if(count($saved)>0){
            return 1;
        }
        else{
            return 0;
        }
    }

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public function like (){
        return $this->hasMany(like::class);
    }

    public function comment(){
        return $this->hasMany(Comment::class);
    }

    public function savePost(){
        return $this->hasMany(Savepost::class);
    }

    public function payedPost(){
        return $this->hasOne(payedposts::class);
    }

    public function photo(){
        return $this->hasMany(Photo::class);
    }

    public function sharePost(){
        return $this->hasMany(sharepost::class);
    }

//    public function video(){
//        return $this->hasMany(Video::class);
//    }

    public function user_profile(){
        return $this->belongsTo(User_profile::class);
    }
}
