<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('/signup',[App\Http\Controllers\AuthenticationController::class, 'signup']);
Route::post('/signin',[App\Http\Controllers\AuthenticationController::class, 'signin']);
Route::get('/billinfo',[App\Http\Controllers\BillInfoController::class, 'index']);
Route::post('/submit',[App\Http\Controllers\BillInfoController::class, 'submit']);
