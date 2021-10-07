<?php

namespace App\Http\Livewire\Admin\Brand;

use App\Models\Brand;
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
    public Brand $brand;


    /**
     * @var string
     * Front type
     */
    protected $paginationTheme = 'bootstrap';
    protected $queryString = ['search'];

    /**
     * @var string[]
     * Prerequisites for creating a category form
     */
    protected $rules = [
        'brand.description' => 'required|min:3',
        'brand.name' => 'required',
        'brand.link' => 'required',
        'brand.parent' => 'nullable',
        'brand.status' => 'nullable',
    ];


    public function mount()
    {
        $this->brand = new Brand();
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

        if ($this->img) {
            $this->brand->img = $this->uploadImage();
        }
        if (!$this->brand->status) {
            $this->brand->status = 0;
        }
        $this->brand->save();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن برند' . '-' . $this->category->title,
            'actionType' => 'ایجاد'
        ]);

        $this->emit('toast', 'success', ' برند با موفقیت ایجاد شد.');
    }


    /**
     * @return string
     * Add image address to database
     */
    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;
        $directory = "brand/$year/$month";
        $name = $this->img->getClientOriginalName();
        $this->img->storeAs($directory, $name);
        return "$directory/$name";
    }


    public function updateCategoryDisable($id)
    {
        $brand = Brand::find($id);
        $brand->update([
            'status' => 0
        ]);

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'غیرفعال کردن وضعیت برند' . '-' . $this->brand->title,
            'actionType' => 'غیرفعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت برند با موفقیت غیرفعال شد.');
    }


    public function updateCategoryEnable($id)
    {
        $brand = Brand::find($id);
        $brand->update([
            'status' => 1
        ]);

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'فعال کردن وضعیت برند' . '-' . $this->brand->title,
            'actionType' => 'فعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت برند با موفقیت فعال شد.');
    }


    public function deleteCategory($id)
    {
        $brand = Brand::find($id);
        $brand->delete();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن برند' . '-' . $this->brand->title,
            'actionType' => 'حذف'
        ]);

        $this->emit('toast', 'success', ' برند با موفقیت حذف شد.');
    }


    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * Reload this Page
     */
    public function render()
    {
        $brands = $this->readyToLoad ? Brand::where('description', 'LIKE', "%{$this->search}%")
            ->orWhere('name', 'LIKE', "%{$this->search}%")
            ->orWhere('link', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];
        return view('livewire.admin.brand.index', compact('brands'));
    }
}
