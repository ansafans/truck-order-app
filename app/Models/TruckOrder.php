<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TruckOrder extends Model
{
    /** @use HasFactory<\Database\Factories\TruckOrderFactory> */
    use HasFactory;

    protected $guarded = [];
    
    public function user(): BelongsTo{
        return $this->belongsTo(User::class);
    }
}