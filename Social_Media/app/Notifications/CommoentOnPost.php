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

class CommoentOnPost extends Notification implements ShouldBroadcast
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
    public function __construct(User $user, $messeg,  post $post, comment $comment)
    {
        $this->user = $user;
        $this->post = $post;
        $this->comment = $comment;
        $this->messeg = $messeg;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database', 'broadcast'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toDatabase($notifiable)
    {
        return [
            'user_id' => $this->user->id,
            'read_at' => null,
            'Post_id' => $this->post->id,
            'comment' => $this->comment->comment,
        ];
    }

    public function toBroadcast($notifiable)
    {
        return new BroadcastMessage([
            'user_id' => $this->user->id,
            'read_at' => null,
            'msg' => $this->messeg,
            'Post_id' => $this->post->id,
            'comment' => $this->comment->comment,
        ]);
    }
}
