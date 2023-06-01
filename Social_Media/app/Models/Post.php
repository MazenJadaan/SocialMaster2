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

    public function like () {
        return $this->hasMany(like::class);
    }
}
