<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use App\Models\User;
use App\Models\Post;
use App\Models\comment;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class CommentOnPost extends Notification implements ShouldBroadcast
{
    use Queueable;
    protected $user;
    protected $post;
    protected $comment;
    protected $messeg;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
//    public function __construct(User $user, $messeg,  post $post, comment $comment)
//    {
//        $this->user = $user;
//        $this->post = $post;
//        $this->comment = $comment;
//        $this->messeg = $messeg;
//    }
    public function __construct( $user, $messeg,$post,$comment)
    {
        $this->user = $user;
        $this->post = $post;
        $this->messeg = $messeg;
       $this->comment =  $comment;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    public function toDatabase($notifiable)
    {
//        return [
//            'user_id' => $this->user->id,
//            'read_at' => null,
//            'Post_id' => $this->post->id,
//            'comment' => $this->comment,
//        ];
        return [
            'user_name' => $this->user,
            // 'read_at' => null,
            'Post_body' => $this->post,
            'msg' => $this->messeg,
            'comment' => $this->comment
        ];
    }

//    public function toBroadcast($notifiable)
//    {
//        return new BroadcastMessage([
//            'user_id' => $this->user->id,
//            'read_at' => null,
//            'msg' => $this->messeg,
//            'Post_id' => $this->post->id,
//            'comment' => $this->comment->comment,
//        ]);
//    }
}
