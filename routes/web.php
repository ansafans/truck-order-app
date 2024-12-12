<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TruckOrderController;
use App\Http\Controllers\UserController;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Route::redirect('/', '/dashboard', 301);

// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['auth', 'verified'])->group(function(){
    Route::get('/dashboard', function () {
        $notifications = Auth::user()->unreadNotifications;
        return Inertia::render('Dashboard', [ 'notifications'=> $notifications ]);
    })->name('dashboard');

    Route::get('/notification/{id}', [UserController:: class, 'notificationMarkAsRead'])->name('notification.markAsRead');

    Route::resource('/orders', TruckOrderController::class);
    Route::get('/orders/{id}/messsage', [TruckOrderController::class, 'message'])->name('orders.message');
    Route::post('/orders/send-message', [TruckOrderController::class, 'sendMessage'])->name('orders.sendMessage');

    Route::resource('/users', UserController::class);
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
