<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('truck_orders', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('contact');
            $table->string("company_name")->nullable();
            $table->longText("description");
            $table->string("size");
            $table->string("weight");
            $table->enum("status", ["pending", "in_progress", "delivered"]);
            $table->string("pickup_name");
            $table->longText("pickup_address");
            $table->string("pickup_city");
            $table->string("pickup_postal_code");
            $table->string("pickup_contact");
            $table->dateTime("pickup_datetime");
            $table->string("destination_name");
            $table->longText("destination_address");
            $table->string("destination_city");
            $table->string("destination_postal_code");
            $table->string("destination_contact");
            $table->dateTime("destination_datetime");
            $table->foreignId("user_id");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('truck_orders');
    }
};
