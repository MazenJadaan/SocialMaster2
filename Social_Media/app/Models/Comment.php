<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class comment extends Model
{
    use HasFactory;

    protected $fillable =[
        'user_id',
        'post_id',
        'comment',
        'post_owner'
    ];

    public function user () {
        return $this->belongsTo('User','user_id') ;
    }
}
