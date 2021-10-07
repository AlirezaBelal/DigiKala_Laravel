<?php

namespace App\Models;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory;
    use SoftDeletes;
    use Sluggable;


    protected $fillable = [
        'img',
        'title',
        'link',
        'name',
        'status_product',
        'vendor_id',
        'category_id',
        'subcategory_id',
        'childcategory_id',
        'color_id',
        'brand_id',
        'tags',
        'body',
        'description',
        'price',
        'discount_price',
        'number',
        'weight',
        'view',
        'shipment',
        'publish_product',
        'original',
        'gift',
        'order_count',
        'special'];


    /**
     * @return \string[][]
     */
    public function sluggable():array
    {
        return [
            'link' => [
                'source' => 'title'
            ]
        ];
    }
}
