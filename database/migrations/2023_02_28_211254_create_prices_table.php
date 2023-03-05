<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('prices', function (Blueprint $table) {
            $table->id();
            $table->string('property_id', 36)->unique();
            $table->integer('duration');
            $table->integer('amount');
            $table->string('currency', 3);
            $table->string('persons');
            $table->string('weekdays');
            $table->integer('minimum_stay');
            $table->integer('maximum_stay');
            $table->integer('extra_person_price');
            $table->string('extra_person_currency', 3);
            $table->date('period_from');
            $table->date('period_till');
            $table->integer('version');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('prices');
    }
};
