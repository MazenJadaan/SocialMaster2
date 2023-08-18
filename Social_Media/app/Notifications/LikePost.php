<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use App\Models\User;
use App\Models\Post;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class LikePost extends Notification implements ShouldBroadcast
{
    use Queueable;
    protected $user;
    protected $messege;
    protected $post;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(User $user, $messege, post $post)
    {
        $this->user = $user;
        $this->post = $post;
        $this->messege = $messege;
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


    public function toDatabase($notifiable)
    {
        return [
            'user_name' => $this->user->first_name,
            // 'read_at' => null,
            'Post_body' => $this->post->post_body,
            'msg' => $this->messege
        ];
    }

    public function toBroadcast($notifiable)
    {
        return new BroadcastMessage([
            'user_id' => $this->user->first_name,
            'read_at' => null,
            'Post_id' => $this->post->post_body,
            'msg' => $this->messege
        ]);
    }
}
