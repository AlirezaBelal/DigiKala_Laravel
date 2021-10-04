<?php

namespace App\Http\Livewire\Admin\Subcategory;

use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithPagination;

class Trashed extends Component
{
    use WithPagination;


    public $img;
    public $search;
    public $readToLoad = false;


    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';


    public function loadCategory()
    {
        $this->readToLoad = true;
    }


    public function deleteCategory($id)
    {
        $subcategory = SubCategory::find($id);
        $subcategory->delete();

        $this->emit('toast', 'success', 'زیردسته با موفقیت حذف شد');
    }

    public function trashedCategory($id)
    {
//        dd($id);
        $subcategory = SubCategory::withTrashed()->where('id' , $id)->first();
        $subcategory->restore();
        $this->emit('toast', 'success', 'زیردسته با موفقیت بازیابی شد');
    }


    public function render()
    {
        $categories = $this->readToLoad ? DB::table('sub_categories')
            ->whereNotNull('deleted_at')
            ->latest()->paginate(10) : [];

        return view('livewire.admin.subcategory.trashed' , compact('categories'));
    }
}
