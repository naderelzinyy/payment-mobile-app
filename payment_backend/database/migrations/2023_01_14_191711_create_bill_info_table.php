<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bill_info', function (Blueprint $table) {
            $table->id();
            $table->String("brand_name");
            $table->String("brand_img")->default(null);
            $table->integer("price")->default(0);
            $table->String("message")->default(null);
            $table->integer("brand_id")->default(0);
            $table->String("date")->default();


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bill_info');
    }
};
