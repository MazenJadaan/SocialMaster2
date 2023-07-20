<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Story extends Model
{
    use HasFactory;

    protected $fillable =[
        'user_id',
        'user_profile_id',
        'story_body',
        'story_date',
        'story_time',
        'story_date_expire',
        'media'
    ];


    public function getStoryDateExpireAttribute()
    {
     return $this->created_at->diffForHumans();
    }

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public function userProfile(){
        return $this->belongsTo(User_profile::class,'user_profile_id');
    }
}
