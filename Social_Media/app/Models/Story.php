<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class story extends Model
{
    use HasFactory;

    protected $fillable =[
        'user_id',
        'user_profile_id',
        'story_body',
        'story_date',
        'story_time',
        'photo_path',
        'video_path'
    ];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public function userProfile(){
        return $this->belongsTo(User_profile::class,'user_profile_id');
    }
}
