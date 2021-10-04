<?php

namespace App\Http\Livewire\Admin\Subcategory;

use App\Models\Category;
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
    public $readToLoad = false;


    public SubCategory $subcategory;


    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';


    public function mount()
    {
        $this->subcategory = new SubCategory();
    }



    public function loadCategory()
    {
        $this->readToLoad = true;
    }


    protected $rules = [
        'subcategory.title' => 'required|min:3',
        'subcategory.name' => 'required',
        'subcategory.link' => 'required',
        'subcategory.parent' => 'required',
        'subcategory.status' => 'nullable',
    ];


    /**
     * @throws \Illuminate\Validation\ValidationException
     */
    public function updated($title)
    {
        $this->validateOnly($title);
    }


    public function categoryForm()
    {
        $this->validate();
        $this->subcategory->img = $this->uploadImage();
        $this->subcategory->save();

        if (!$this->subcategory->status) {
            $this->subcategory->update([
                'status' => 0
            ]);
        }

        $this->emit('toast', 'success', ' زیردسته با موفقیت ایجاد شد.');
    }


    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;

        $directory = "subcategory/$year/$month";

        $name = $this->img->getClientOriginalName();

        $this->img->storeAs($directory, $name);

        return "$directory/$name";
    }


    public function updateCategoryDisable($id)
    {
        $category = SubCategory::find($id);

        $category->update([
            "status" => 0
        ]);

        $this->emit('toast', 'success', 'وضعیت زیردسته با موفقیت غیر فعال شد.');
    }


    public function updateCategoryEnable($id)
    {
        $category = SubCategory::find($id);

        $category->update([
            "status" => 1
        ]);

        $this->emit('toast', 'success', 'وضعیت زیردسته با موفقیت فعال شد.');
    }


    public function deleteCategory($id)
    {
        $category = SubCategory::find($id);
        $category->delete();

        $this->emit('toast', 'success', 'زیردسته با موفقیت حذف شد');
    }


    public function render()
    {
        $categories = $this->readToLoad ? SubCategory::where('title', 'LIKE', "%{$this->search}%")
            ->orWhere('id', "{$this->search}")
            ->orWhere('name', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];

        return view('livewire.admin.subcategory.index' , compact('categories'));
    }
}
