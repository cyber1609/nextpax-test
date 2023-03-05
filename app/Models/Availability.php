<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Availability extends Model
{
    protected $fillable = [
    ];

    protected $casts = [
        'date' => 'date',
        'arrival_allowed' => 'boolean',
        'departure_allowed' => 'boolean',
    ];
}
