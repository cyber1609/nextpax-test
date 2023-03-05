<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Price extends Model
{
    protected $fillable = [
    ];

    protected $casts = [
        'period_from' => 'date',
        'period_till' => 'date',
        'arrival_allowed' => 'boolean',
        'departure_allowed' => 'boolean',
    ];
}
