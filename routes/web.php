<?php

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

Route::get('/', 'PictureController@index');


Route::get('picture/', 'PictureController@index')->name('picture.index');

Route::get('picture/create', 'PictureController@create')->name('picture.create');

Route::post('picture/', 'PictureController@store')->name('picture.store');

Route::get('picture/show/{id}', 'PictureController@edit')->name('picture.edit');

Route::get('picture/edit/{id}', 'PictureController@show')->name('picture.show');

Route::patch('picture/show/{id}', 'PictureController@update')->name('picture.update');

Route::delete('picture/{id}', 'PictureController@destroy')->name('picture.destroy');




Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
