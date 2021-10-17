<?php

namespace App\Http\Livewire\Admin\Brand;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Log;
use App\Models\Product;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;

class Index extends Component
{
    use WithFileUploads;
    use WithPagination;


    public Brand $brand;
    public $img;
    public $search;
    public $readyToLoad = false;


    protected $queryString = ['search'];
    /**
     * @var string
     * Site front type
     */
    protected $paginationTheme = 'bootstrap';


    /**
     * @var string[]
     * Input rules
     */
    protected $rules = [
        'brand.description' => 'required|min:3',
        'brand.name' => 'required',
        'brand.link' => 'required',
        'brand.parent' => 'required',
        'brand.status' => 'nullable',
        'brand.vip' => 'nullable',
    ];


    public function mount()
    {
        $this->brand = new Brand();
    }


    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


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

        $brand = Brand::query()->create([
            'description' => $this->brand->description,
            'name' => $this->brand->name,
            'link' => $this->brand->link,
            'parent' => $this->brand->parent,
            'status' => $this->brand->status ? 1 : 0,
            'vip' => $this->brand->vip ? 1 : 0,
        ]);

        if ($this->img) {
            $brand->update([
                'img' => $this->uploadImage()
            ]);
        }

        //Empty the form then fill out the form
        $this->brand->description = "";
        $this->brand->name = "";
        $this->brand->link = "";
        $this->brand->parent = null;
        $this->brand->status = false;
        $this->brand->vip = false;
        $this->img = null;

        //Create a report
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن برند' . '-' . $this->brand->name,
            'actionType' => 'ایجاد'
        ]);

        $this->emit('toast', 'success', ' برند با موفقیت ایجاد شد.');
    }


    /**
     * @return string
     * Upload image to memory
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
            'url' => 'غیرفعال کردن وضعیت برند' . '-' . $this->brand->name,
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
            'url' => 'فعال کردن وضعیت برند' . '-' . $this->brand->name,
            'actionType' => 'فعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت برند با موفقیت فعال شد.');
    }


    public function updateBrandDisable($id)
    {
        $brand = Brand::find($id);
        $brand->update([
            'vip' => 0
        ]);
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'غیرفعال کردن وضعیت برند' . '-' . $this->brand->title,
            'actionType' => 'غیرفعال'
        ]);
        $this->emit('toast', 'success', 'وضعیت برند با موفقیت غیرفعال شد.');
    }


    public function updateBrandEnable($id)
    {
        $brand = Brand::find($id);
        $brand->update([
            'vip' => 1
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

        $product = Product::where('brand_id', $id)->first();

        if ($product == null) {
            $brand->delete();
            Log::create([
                'user_id' => auth()->user()->id,
                'url' => 'حذف کردن برند' . '-' . $this->brand->name,
                'actionType' => 'حذف'
            ]);

            $this->emit('toast', 'success', ' برند با موفقیت حذف شد.');
        } else {
            $this->emit('toast', 'success', ' امکان حذف وجود ندارد زیرا برند، شامل محصول است!');
        }
    }


    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * Send information to the site and load the site
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
