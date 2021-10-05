<?php

namespace App\Http\Livewire\Admin\Subcategory;

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


    public function deleteCategory($id)
    {
        $category = SubCategory::find($id);
        $category->delete();
        $this->emit('toast', 'success', ' زیر دسته با موفقیت حذف شد.');
    }


    public function trashedCategory($id)
    {
        $category = SubCategory::withTrashed()->where('id', $id)->first();
        $category->restore();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'بازیابی زیردسته' . '-' . $category->title,
            'actionType' => 'بازیابی'
        ]);

        $this->emit('toast', 'success', ' زیر دسته با موفقیت بازیابی شد.');
    }


    public function render()
    {

        $categories = $this->readyToLoad ? DB::table('sub_categories')
            ->whereNotNull('deleted_at')
            ->latest()->paginate(15) : [];

        return view('livewire.admin.subcategory.trashed', compact('categories'));
    }
}
