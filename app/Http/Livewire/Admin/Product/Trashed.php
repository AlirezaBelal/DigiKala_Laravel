<?php

namespace App\Http\Livewire\Admin\Product;

use App\Models\Category;
use App\Models\Log;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithPagination;

class Trashed extends Component
{
    use WithPagination;

    public $search;
    public $readyToLoad = false;

    /**
     * @var string
     * Front type
     */
    protected $paginationTheme = 'bootstrap';
    protected $queryString = ['search'];


    /**
     * Change page load
     */
    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


    /**
     * @param $id
     * Empty the delete key in the database (in other words, return it from the trash)
     */
    public function trashedProduct($id)
    {
        $product = Product::withTrashed()->where('id', $id)->first();
        $product->restore();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'بازیابی محصول' . '-' . $product->title,
            'actionType' => 'بازیابی'
        ]);

        $this->emit('toast', 'success', ' محصول با موفقیت بازیابی شد.');
    }


    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * Reload this Page
     */
    public function render()
    {
        $products = $this->readyToLoad ? DB::table('products')
            ->whereNotNull('deleted_at')
            ->latest()->paginate(10) : [];

        return view('livewire.admin.product.trashed' , compact('products'));
    }
}
