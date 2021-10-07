<?php

namespace App\Http\Livewire\Admin\Brand;

use App\Models\Brand;
use App\Models\Log;
use App\Models\SubCategory;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithPagination;

class Trashed extends Component
{
    use WithPagination;

    public $img;
    public $search;
    public $readyToLoad = false;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';


    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


    public function trashedCategory($id)
    {
        $brand = Brand::withTrashed()->where('id', $id)->first();
        $brand->restore();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'بازیابی برند' . '-' . $brand->title,
            'actionType' => 'بازیابی'
        ]);

        $this->emit('toast', 'success', ' برند با موفقیت بازیابی شد.');
    }


    public function render()
    {

        $brands = $this->readyToLoad ? DB::table('brands')
            ->whereNotNull('deleted_at')
            ->latest()->paginate(10) : [];
        return view('livewire.admin.brand.trashed' , compact('brands'));
    }
}
