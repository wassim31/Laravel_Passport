<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Swagger Documentation Route
Route::get('/api/documentation', function () {
    return redirect('/api/docs');
});
