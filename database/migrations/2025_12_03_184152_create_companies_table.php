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
        Schema::create('companies', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('business_name')->nullable();
            $table->string('license')->nullable();
            $table->string('insurance')->nullable();
            $table->string('phone')->nullable();
            $table->string('location')->nullable();
            $table->string('store_name')->nullable();
            $table->integer('contractor_limit')->default(0);
            $table->boolean('is_profile_completed')->default(false);
            $table->boolean('is_profile_approved')->default(false);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('companies');
    }
};
