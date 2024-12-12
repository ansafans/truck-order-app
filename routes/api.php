<?php

use App\Http\Controllers\Api\TruckOrderController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/auth/register', [UserController::class, 'register']);
Route::post('/auth/login', [UserController::class, 'login']);

Route::middleware('auth:sanctum')->group(function(){
    Route::get('/auth/logout', [UserController::class, 'logout']);

    Route::resource('/orders', TruckOrderController::class);
    Route::get('/user', function (Request $request){ return $request->user(); });
});