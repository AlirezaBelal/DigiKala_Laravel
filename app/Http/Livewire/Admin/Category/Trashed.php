<?php

namespace App\Http\Livewire\Admin\Category;

use App\Models\Category;
use App\Models\Log;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithPagination;

class Trashed extends Component
{
    use WithPagination;

    public $img;
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


    public function deleteCategory($id)
    {
        $category = Category::find($id);
        $category->delete();
        $this->emit('toast', 'success', ' دسته با موفقیت حذف شد.');
    }


    /**
     * @param $id
     * Empty the delete key in the database (in other words, return it from the trash)
     */
    public function trashedCategory($id)
    {
        $category = Category::withTrashed()->where('id', $id)->first();
        $category->restore();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'بازیابی دسته' . '-' . $category->title,
            'actionType' => 'بازیابی'
        ]);

        $this->emit('toast', 'success', ' دسته با موفقیت بازیابی شد.');
    }


    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * Reload this Page
     */
    public function render()
    {
        $categories = $this->readyToLoad ? DB::table('categories')
            ->whereNotNull('deleted_at')
            ->latest()->paginate(10) : [];

        return view('livewire.admin.category.trashed', compact('categories'));
    }
}
