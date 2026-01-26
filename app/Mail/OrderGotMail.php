<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderGotMail extends Mailable
{
    use Queueable, SerializesModels;

    public $order; // 👈 full order object

    public function __construct($order)
    {
        $this->order = $order['data'] ?? $order;
    }

    public function build()
    {
        return $this->subject("🎂 New Order #{$this->order->order_serial_no} Received!")
                    ->markdown('emails.orderGot', [
                        'order' => $this->order,
                    ]);
    }
}
