<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
//$2y$10$8yUtwbsb.WZjJc/U/s3HOuoEboydAxwR7mXDxMjVYvVrH1aoUvvVm
return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bill_infos', function (Blueprint $table) {
            $table->id();
            $table->String("brand_name");
            $table->String("brand_img")->default(null);
            $table->integer("price")->default(0);
            $table->String("message")->default(null);
            $table->integer("brand_id")->default(0);
            $table->String("date")->default(21-12-2023);
            $table->unsignedBigInteger('payment_users_id')->collation('utf8mb4_unicode_ci');
            $table->foreign('payment_users_id')->references('id')->on('users');

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
        Schema::dropIfExists('bill_infos');
    }
};
