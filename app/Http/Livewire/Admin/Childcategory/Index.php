<?php

namespace App\Http\Livewire\Admin\Childcategory;

use App\Models\ChildCategory;
use App\Models\SubCategory;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;

class Index extends Component
{
    use WithFileUploads;
    use WithPagination;

    public $img;
    public $search;
    public $readyToLoad = false;
    public ChildCategory $childcategory;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';

    protected $rules = [
        'childcategory.title' => 'required|min:3',
        'childcategory.name' => 'required',
        'childcategory.link' => 'required',
        'childcategory.parent' => 'required',
        'childcategory.status' => 'nullable',
    ];


    public function mount()
    {
        $this->childcategory = new ChildCategory();
    }


    public function updated($title)
    {
        $this->validateOnly($title);
    }


    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


    public function categoryForm()
    {
        $this->validate();
        $this->childcategory->img = $this->uploadImage();
        $this->childcategory->save();
        if (!$this->childcategory->status) {
            $this->childcategory->update([
                'status' => 0
            ]);
        }

        $this->emit('toast', 'success', ' دسته کودک با موفقیت ایجاد شد.');
    }


    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;
        $directory = "childcategory/$year/$month";
        $name = $this->img->getClientOriginalName();
        $this->img->storeAs($directory, $name);
        return "$directory/$name";
    }


    public function updateCategoryDisable($id)
    {
        $category = ChildCategory::find($id);
        $category->update([
            'status' => 0
        ]);

        $this->emit('toast', 'success', 'وضعیت دسته کودک با موفقیت غیرفعال شد.');
    }


    public function updateCategoryEnable($id)
    {
        $category = ChildCategory::find($id);
        $category->update([
            'status' => 1
        ]);

        $this->emit('toast', 'success', 'وضعیت دسته کودک با موفقیت فعال شد.');
    }


    public function deleteCategory($id)
    {
        $category = ChildCategory::find($id);
        $category->delete();

        $this->emit('toast', 'success', ' دسته کودک با موفقیت حذف شد.');
    }


    public function render()
    {
        $categories = $this->readyToLoad ? ChildCategory::where('title', 'LIKE', "%{$this->search}%")
            ->orWhere('name', 'LIKE', "%{$this->search}%")
            ->orWhere('link', 'LIKE', "%{$this->search}%")
            ->orWhere('id', $this->search)
            ->latest()->paginate(10) : [];

        return view('livewire.admin.childcategory.index',compact('categories'));
    }
}