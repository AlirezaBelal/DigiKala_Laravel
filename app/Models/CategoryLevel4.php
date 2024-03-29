<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CategoryLevel4 extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['img', 'title', 'link', 'name', 'parent', 'status'];
}
