<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderStatusChangedMail extends Mailable
{
    use Queueable, SerializesModels;

    public $order;
    public $oldStatus;
    public $newStatus;

    public function __construct($order, $oldStatus, $newStatus)
    {
        $this->order = $order;
        $this->oldStatus = $oldStatus;
        $this->newStatus = $newStatus;
    }

    public function build()
    {
        return $this->subject("Your Order #{$this->order->order_serial_no} Status Updated!")
                    ->markdown('emails.orderStatusChanged', [
                        'order' => $this->order,
                        'oldStatus' => $this->oldStatus,
                        'newStatus' => $this->newStatus,
                    ]);
    }
}
