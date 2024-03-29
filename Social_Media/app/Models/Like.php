<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;


class like extends Model
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'user_id',
        'post_id',
        'post_owner'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function postOwner()
    {
        return $this->belongsTo(User::class, 'post_owner');
    }

    public function post()
    {
        return $this->belongsTo(Post::class, 'post_id');
    }
}
