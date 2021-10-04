<?php

namespace App\Http\Livewire\Admin\Category;

use App\Models\Category;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;
use mysql_xdevapi\Table;

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
        $category = Category::find($id);
        $category->delete();

        $this->emit('toast', 'success', 'دسته با موفقیت حذف شد');
    }

    public function trashedCategory($id)
    {
//        dd($id);
        $category = Category::withTrashed()->where('id' , $id)->first();
        $category->restore();
        $this->emit('toast', 'success', 'دسته با موفقیت بازیابی شد');
    }


    public function render()
    {
        $categories = $this->readToLoad ? DB::table('categories')
            ->whereNotNull('deleted_at')
            ->latest()->paginate(10) : [];

        return view('livewire.admin.category.trashed' , compact('categories'));
    }
}
