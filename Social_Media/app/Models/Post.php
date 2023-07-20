<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class post extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'user_profile_id',
        'post_body',
        'post_time',
        'post_date'
    ];

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
