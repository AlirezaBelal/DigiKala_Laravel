<?php

namespace App\Http\Livewire\Admin\Category;

use App\Models\Category;
use http\QueryString;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;
use function Symfony\Component\Translation\t;

class Index extends Component
{
    use WithFileUploads;
    use WithPagination;


    public $img;
    public $search;
    public $readToLoad = false;


    public Category $category;


    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';


    public function mount()
    {
        $this->category = new Category();
    }


    public function loadCategory()
    {
        $this->readToLoad = true;
    }


    protected $rules = [
        'category.title' => 'required|min:3',
        'category.name' => 'required',
        'category.link' => 'required',
        'category.status' => 'nullable',
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
        $this->category->img = $this->uploadImage();
        $this->category->save();

        if (!$this->category->status) {
            $this->category->update([
                'status' => 0
            ]);
        }

//        $this->reset();
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
            "status" => 0
        ]);

        $this->emit('toast', 'success', 'وضعیت دسته با موفقیت غیر فعال شد.');
    }


    public function updateCategoryEnable($id)
    {
        $category = Category::find($id);

        $category->update([
            "status" => 1
        ]);

        $this->emit('toast', 'success', 'وضعیت دسته با موفقیت فعال شد.');
    }


    public function deleteCategory($id)
    {
        $category = Category::find($id);
        $category->delete();

        $this->emit('toast', 'success', 'دسته با موفقیت حذف شد');
    }


    public function render()
    {
        $categories = $this->readToLoad ? Category::where('title', 'LIKE', "%{$this->search}%")
            ->orWhere('id', "{$this->search}")
            ->orWhere('name', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];

        return view('livewire.admin.category.index', compact('categories'));
    }
}
