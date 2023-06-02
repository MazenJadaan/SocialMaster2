<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use App\Models\Comment;
use App\Models\User_profile;
use App\Models\like;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id',
        'first_name',
        'last_name',
        'email',
        'password',
        'phone_num',
        'gender',
        'birthdate',
        'provider_id',
        'provider_name',
        'google_access_token_json',

    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    /////////// setter and getter of model /////////////
    public  function  setPasswordAttribute($value){
        $this->attributes['password'] = bcrypt($value);
    }
    public function setGenderAttribute($value)
    {
        if($value== 'female')
        $this->attributes['gender'] = 0;
        elseif($value == 'male')
            $this->attributes['gender'] = 1;
    }
    public function getGenderAttribute($value)
    {
        if($value == 0)
        return 'female';
        elseif($value == 1)
            return 'male';
    }
    public function setBirthdateAttribute($value)
    {
        $this->attributes['birthdate'] = Carbon::createFromFormat('d/m/Y', $value)->toDateString();
    }
    /////////// setter and getter of model /////////////
    ///
    ///
    //////////  Relationship //////////////////

    public function user_profile(){
        return  $this->hasOne(User_profile::class);
    }

    public function post(){
        return $this->hasMany(Post::class);
    }

    public function comment(){
        return $this->hasMany(Comment::class);
    }

    public function like (){
        return $this->hasMany(Like::class);
    }

    public function owner (){
        return $this->hasMany(like::class);
    }

    public function savePost(){
        return $this->hasMany(Savepost::class);
    }

    public function payedPost(){
        return $this->hasMany(payedposts::class);
    }

    public function sharePost() {
        return $this->hasMany(sharepost::class);
    }

    public function userFollower(){
        return $this->hasMany(userfollowers::class);
    }

    public function story(){
        return $this->hasMany(Story::class);
    }

//////////  Relationship //////////////////
}
