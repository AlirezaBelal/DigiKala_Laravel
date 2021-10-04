<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ChildCategory extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'title',
        'name',
        'parent',
        'img',
        'link',
        'status'
    ];
}