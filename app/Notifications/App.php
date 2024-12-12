<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class App extends Notification
{
    use Queueable;

    protected $action;
    protected $data;
    protected $type;

    /**
     * Create a new notification instance.
     */
    public function __construct($type, $action, $data)
    {
        $this-> data = $data;
        $this-> action = $action;
        $this-> type = $type;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            'type'=> $this->type,
            'action'=> $this->action,
            'data'=> $this->data
        ];
    }
}
