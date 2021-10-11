<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductSeller extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
      'vendor_id',
      'product_id',
      'warranty_id',
      'color_id',
      'product_count',
      'limit_order',
      'time',
      'price',
      'discount_price',
      'status'];
}
