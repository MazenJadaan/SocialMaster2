<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class User_profile extends Model
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'id',
        'job',
        'study_place',
        'place_stay',
        'place_born',
        'bio',
        'cover_photo',
        'profile_photo',
        'followers_number',
        'state',
        'user_id',
        'following_number'
    ];

    ////////////// Relatioship ///////////////
    public  function user(){
        return $this->belongsTo(User::class);
    }

    public function userFollower(){
        return $this->hasMany(userfollowers::class);
    }

    public function story(){
        return $this->hasMany(Story::class);
    }

    public function officailAccount(){
        return $this->hasOne(officialaccounts::class);
    }

    public function post(){
        return $this->hasMany(Post::class);
    }
    /// //////////  Relationship //////////////////
    ///
    ///


}
