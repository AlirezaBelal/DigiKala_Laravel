<?php

namespace App\Http\Livewire\Admin\Category;

use App\Models\Category;
use App\Models\Log;
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
    public Category $category;

    protected $paginationTheme = 'bootstrap';
    protected $listeners = [
        'category.added' => '$refresh'
    ];

    protected $queryString = ['search'];

    protected $rules = [
        'category.title' => 'required|min:3',
        'category.name' => 'required',
        'category.link' => 'required',
        'category.status' => 'nullable',
    ];


    public function mount()
    {
        $this->category = new Category();
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
        $this->category->img = $this->uploadImage();
        $this->category->save();
        if (!$this->category->status) {
            $this->category->update([
                'status' => 0
            ]);
        }
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن دسته' .'-'. $this->category->title,
            'actionType' => 'ایجاد'
        ]);

        $this->emit('toast', 'success', ' دسته با موفقیت ایجاد شد.');
    }


    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;
        $directory = "category/$year/$month";
        $name = $this->img->getClientOriginalName();
        $this->img->storeAs($directory, $name);
        return "$directory/$name";
    }


    public function updateCategoryDisable($id)
    {
        $category = Category::find($id);
        $category->update([
            'status' => 0
        ]);

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'غیرفعال کردن وضعیت دسته' .'-'. $this->category->title,
            'actionType' => 'غیرفعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت دسته با موفقیت غیرفعال شد.');
    }


    public function updateCategoryEnable($id)
    {
        $category = Category::find($id);
        $category->update([
            'status' => 1
        ]);

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'فعال کردن وضعیت دسته' .'-'. $this->category->title,
            'actionType' => 'فعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت دسته با موفقیت فعال شد.');
    }


    public function deleteCategory($id)
    {
        $category = Category::find($id);
        $category->delete();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن دسته' .'-'. $this->category->title,
            'actionType' => 'حذف'
        ]);

        $this->emit('toast', 'success', ' دسته با موفقیت حذف شد.');
    }


    public function render()
    {

        $categories = $this->readyToLoad ? Category::where('title', 'LIKE', "%{$this->search}%")
            ->orWhere('name', 'LIKE', "%{$this->search}%")
            ->orWhere('link', 'LIKE', "%{$this->search}%")
            ->orWhere('id', $this->search)
            ->latest()->paginate(10) : [];

        return view('livewire.admin.category.index', compact('categories'));
    }
}
