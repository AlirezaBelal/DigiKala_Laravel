<?php

namespace App\Http\Livewire\Admin\Childcategory;

use App\Models\Category;
use App\Models\ChildCategory;
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
        $childcategory = ChildCategory::find($id);
        $childcategory->delete();

        $this->emit('toast', 'success', 'دسته کودک با موفقیت حذف شد');
    }

    public function trashedCategory($id)
    {
//        dd($id);
        $childcategory = ChildCategory::withTrashed()->where('id' , $id)->first();
        $childcategory->restore();
        $this->emit('toast', 'success', 'دسته کودک با موفقیت بازیابی شد');
    }


    public function render()
    {
        $categories = $this->readToLoad ? DB::table('child_categories')
            ->whereNotNull('deleted_at')
            ->latest()->paginate(10) : [];

        return view('livewire.admin.childcategory.trashed' , compact('categories'));
    }
}
