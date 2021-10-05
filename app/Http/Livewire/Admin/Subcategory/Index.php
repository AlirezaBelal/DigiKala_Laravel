<?php

namespace App\Http\Livewire\Admin\Subcategory;

use App\Models\Log;
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
    public SubCategory $subcategory;

    protected $paginationTheme = 'bootstrap';
    protected $queryString = ['search'];

    protected $rules = [
        'subcategory.title' => 'required|min:3',
        'subcategory.name' => 'required',
        'subcategory.link' => 'required',
        'subcategory.parent' => 'required',
        'subcategory.status' => 'nullable',
    ];


    public function mount()
    {
        $this->subcategory = new SubCategory();
    }


    /**
     * @throws \Illuminate\Validation\ValidationException
     */
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
        if ($this->img) {
            $this->subcategory->img = $this->uploadImage();
        }

        if (!$this->subcategory->status) {
            $this->subcategory->status = 0;
        }

        $this->subcategory->save();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن زیردسته ' . '-' . $this->subcategory->title,
            'actionType' => 'ایجاد'
        ]);

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
            'status' => 0
        ]);

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'غیرفعال کردن وضعیت  زیردسته' . '-' . $category->title,
            'actionType' => 'غیرفعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت زیر دسته با موفقیت غیرفعال شد.');
    }


    public function updateCategoryEnable($id)
    {
        $category = SubCategory::find($id);
        $category->update([
            'status' => 1
        ]);

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'فعال کردن وضعیت زیردسته' . '-' . $category->title,
            'actionType' => 'فعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت زیر دسته با موفقیت فعال شد.');
    }


    public function deleteCategory($id)
    {
        $category = SubCategory::find($id);
        $category->delete();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن زیردسته ' . '-' . $category->title,
            'actionType' => 'حذف'
        ]);

        $this->emit('toast', 'success', ' زیر دسته با موفقیت حذف شد.');
    }


    public function render()
    {

        $categories = $this->readyToLoad ? SubCategory::where('title', 'LIKE', "%{$this->search}%")
            ->orWhere('name', 'LIKE', "%{$this->search}%")
            ->orWhere('link', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];

        return view('livewire.admin.subcategory.index', compact('categories'));
    }
}
