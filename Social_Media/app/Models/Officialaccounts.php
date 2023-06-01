<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class officialaccounts extends Model
{
    use HasFactory;

    protected $fillable =[
        'user_profile_id',
    ];
}
