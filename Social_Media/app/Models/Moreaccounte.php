<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class moreaccounte extends Model
{
    use HasFactory;

    protected $fillable = 
    [
        'user_profile_id',
        'link',
        'type'
    ];
}
