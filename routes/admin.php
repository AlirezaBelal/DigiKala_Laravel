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


//======================================>logSystem
Route::get('/log',\App\Http\Livewire\Admin\Log\Index::class)
    ->name('log.index');

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

//=======================================> //Product//
Route::get('/product',\App\Http\Livewire\Admin\Product\Index::class)
    ->name('product.index');

Route::get('/product/create',\App\Http\Livewire\Admin\Product\Create::class)
    ->name('product.create');

Route::get('/product/update/{product}',\App\Http\Livewire\Admin\Product\Update::class)
    ->name('product.update');

Route::get('/product/trashed',\App\Http\Livewire\Admin\Product\Trashed::class)
    ->name('product.trashed');

//=======================================> //product . Color//
Route::get('/product/color',\App\Http\Livewire\Admin\Product\Color\Index::class)
    ->name('color.index');

Route::get('/product/color/update/{color}',\App\Http\Livewire\Admin\Product\Color\Update::class)
    ->name('color.update');

Route::get('/product/color/trashed',\App\Http\Livewire\Admin\Product\Color\Trashed::class)
    ->name('color.trashed');

//=======================================> //Brands//
Route::get('/brand',\App\Http\Livewire\Admin\Brand\Index::class)
    ->name('brand.index');

Route::get('/brand/update/{brand}',\App\Http\Livewire\Admin\Brand\Update::class)
    ->name('brand.update');

Route::get('/brand/trashed',\App\Http\Livewire\Admin\Brand\Trashed::class)
    ->name('brand.trashed');


