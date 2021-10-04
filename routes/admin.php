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

//======================================>admin/dashboard
Route::get('/',\App\Http\Livewire\Admin\Dashbord\Index::class)
    ->name('admin.index');


//=======================================> //category//
//category
Route::get('/category' , \App\Http\Livewire\Admin\Category\Index::class)
    ->name('category.index');

Route::get('/category/update/{category}' , \App\Http\Livewire\Admin\Category\Update::class)
    ->name('category.update');

Route::get('/category/trashed' , \App\Http\Livewire\Admin\Category\Trashed::class)
    ->name('category.trashed');

//subcategory
Route::get('/subcategory' , \App\Http\Livewire\Admin\Subcategory\Index::class)
    ->name('subcategory.index');

Route::get('/subcategory/update/{subcategory}' , \App\Http\Livewire\Admin\Subcategory\Update::class)
    ->name('subcategory.update');

Route::get('/subcategory/trashed' , \App\Http\Livewire\Admin\Subcategory\Trashed::class)
    ->name('subcategory.trashed');

//childcategory
Route::get('/childcategory' , \App\Http\Livewire\Admin\Childcategory\Index::class)
    ->name('childcategory.index');

Route::get('/childcategory/update/{childcategory}' , \App\Http\Livewire\Admin\Childcategory\Update::class)
    ->name('childcategory.update');

Route::get('/childcategory/trashed' , \App\Http\Livewire\Admin\Childcategory\Trashed::class)
    ->name('childcategory.trashed');
