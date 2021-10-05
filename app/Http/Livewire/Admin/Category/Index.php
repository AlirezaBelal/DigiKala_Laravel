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


    /**
     * @var string
     * Front type
     */
    protected $paginationTheme = 'bootstrap';
    protected $listeners = [
        'category.added' => '$refresh'
    ];

    protected $queryString = ['search'];

    /**
     * @var string[]
     * Prerequisites for creating a category form
     */
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


    /**
     * @throws \Illuminate\Validation\ValidationException
     *
     */
    public function updated($title)
    {
        $this->validateOnly($title);
    }


    /**
     * Change page load
     */
    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


    /**
     * Enter information in the database
     */
    public function categoryForm()
    {
        $this->validate();
        if($this->category->img){
            $this->category->img = $this->uploadImage();
        }
        if (!$this->category->status) {
            $this->category->status = 0;
        }
        $this->category->save();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن دسته' . '-' . $this->category->title,
            'actionType' => 'ایجاد'
        ]);

        $this->emit('toast', 'success', ' دسته با موفقیت ایجاد شد.');
    }


    /**
     * @return string
     * Add image address to database
     */
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
            'url' => 'غیرفعال کردن وضعیت دسته' . '-' . $this->category->title,
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
            'url' => 'فعال کردن وضعیت دسته' . '-' . $this->category->title,
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
            'url' => 'حذف کردن دسته' . '-' . $this->category->title,
            'actionType' => 'حذف'
        ]);

        $this->emit('toast', 'success', ' دسته با موفقیت حذف شد.');
    }


    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * Reload this Page
     */
    public function render()
    {
        $categories = $this->readyToLoad ? Category::where('title', 'LIKE', "%{$this->search}%")
            ->orWhere('name', 'LIKE', "%{$this->search}%")
            ->orWhere('link', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];

        return view('livewire.admin.category.index', compact('categories'));
    }
}
