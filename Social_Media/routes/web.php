<?php

use App\Models\post;
use App\Models\User_profile;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/main',function (){
    return 'login succesful it\'' ;
});
Route::get('/user',function (){
    $photo = \App\Models\photo::find(13);
    return view('posts',['photo'=>$photo]);
});
