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

//=======================================> //categories//
//=======================================>//category//
Route::get('/category' , \App\Http\Livewire\Admin\Category\Index::class)
    ->name('category.index');

Route::get('/category/update/{category}' , \App\Http\Livewire\Admin\Category\Update::class)
    ->name('category.update');

Route::get('/category/trashed' , \App\Http\Livewire\Admin\Category\Trashed::class)
    ->name('category.trashed');

//=======================================>//subcategory
Route::get('/subcategory' , \App\Http\Livewire\Admin\Subcategory\Index::class)
    ->name('subcategory.index');

Route::get('/subcategory/update/{subcategory}' , \App\Http\Livewire\Admin\Subcategory\Update::class)
    ->name('subcategory.update');

Route::get('/subcategory/trashed' , \App\Http\Livewire\Admin\Subcategory\Trashed::class)
    ->name('subcategory.trashed');

//=======================================>//childcategory
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

//=======================================> //product . Gallery//
Route::get('/gallery',\App\Http\Livewire\Admin\Product\Gallery\Index::class)
    ->name('gallery.index');

Route::get('/gallery/update/{gallery}',\App\Http\Livewire\Admin\Product\Gallery\Update::class)
    ->name('gallery.update');

Route::get('/gallery/product/{product}',\App\Http\Livewire\Admin\Product\Gallery\Product::class)
    ->name('product.gallery_image');

//=======================================> //Brands//
Route::get('/brand',\App\Http\Livewire\Admin\Brand\Index::class)
    ->name('brand.index');

Route::get('/brand/update/{brand}',\App\Http\Livewire\Admin\Brand\Update::class)
    ->name('brand.update');

Route::get('/brand/trashed',\App\Http\Livewire\Admin\Brand\Trashed::class)
    ->name('brand.trashed');

//=======================================> //Warranties//
Route::get('/product/warranty',\App\Http\Livewire\Admin\Product\Warranty\Index::class)
    ->name('warranty.index');

Route::get('/product/warranty/update/{warranty}',\App\Http\Livewire\Admin\Product\Warranty\Update::class)
    ->name('warranty.update');

Route::get('/product/warranty/trashed',\App\Http\Livewire\Admin\Product\Warranty\Trashed::class)
    ->name('warranty.trashed');

//=======================================> //Product Vendor//
Route::get('/productVendor',\App\Http\Livewire\Admin\Product\ProductVendor\Index::class)
    ->name('productVendor.index');

Route::get('/productVendor/create',\App\Http\Livewire\Admin\Product\ProductVendor\Create::class)
    ->name('productVendor.create');

Route::get('/productVendor/update/{productSeller}',\App\Http\Livewire\Admin\Product\ProductVendor\Update::class)
    ->name('productSeller.update');

Route::get('/productVendor/trashed',\App\Http\Livewire\Admin\Product\ProductVendor\Trashed::class)
    ->name('productVendor.trashed');

Route::get('/productVendor/product/{product}',\App\Http\Livewire\Admin\Product\ProductVendor\Single::class)
    ->name('product.productVendor');

//=======================================> //Attribute//
Route::get('/attribute',\App\Http\Livewire\Admin\Product\Attribute\Index::class)
    ->name('attribute.index');

Route::get('/attribute/update/{attribute}',\App\Http\Livewire\Admin\Product\Attribute\Update::class)
    ->name('attribute.update');

Route::get('/attribute/trashed',\App\Http\Livewire\Admin\Product\Attribute\Trashed::class)
    ->name('attribute.trashed');

Route::get('/attribute/category/{category}',\App\Http\Livewire\Admin\Product\Attribute\Category::class)
    ->name('category.attribute');

//=======================================> //Attribute Value//
Route::get('/attributeValue',\App\Http\Livewire\Admin\Product\AttributeValue\Index::class)
    ->name('attributeValue.index');

Route::get('/attributeValue/update/{attribute}',\App\Http\Livewire\Admin\Product\AttributeValue\Update::class)
    ->name('attributeValue.update');

Route::get('/attributeValue/trashed',\App\Http\Livewire\Admin\Product\AttributeValue\Trashed::class)
    ->name('attributeValue.trashed');

Route::get('/attribute/product/{product}',\App\Http\Livewire\Admin\Product\Attribute\Product::class)
    ->name('product.attribute');
