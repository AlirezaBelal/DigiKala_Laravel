<?php

namespace App\Http\Livewire\Admin\Product;

use App\Models\Log;
use App\Models\Product;
use Livewire\Component;
use Livewire\WithFileUploads;

class Create extends Component
{
    use WithFileUploads;

    public $img;
    public Product $product;

    /**
     * @var string[]
     * Handle form inputs
     */
    protected $rules = [
        'product.title' => 'required|min:3',
        'product.name' => 'required',
        'product.vendor_id' => 'nullable',
        'product.category_id' => 'nullable',
        'product.status_product' => 'nullable',
        'product.subcategory_id' => 'nullable',
        'product.childcategory_id' => 'nullable',
        'product.color_id' => 'nullable',
        'product.brand_id' => 'nullable',
        'product.tags' => 'nullable',
        'product.body' => 'nullable',
        'product.description' => 'nullable',
        'product.price' => 'nullable',
        'product.discount_price' => 'nullable',
        'product.number' => 'nullable',
        'product.weight' => 'nullable',
        'product.view' => 'nullable',
        'product.shipment' => 'nullable',
        'product.publish_product' => 'nullable',
        'product.gift' => 'nullable',
        'product.original' => 'nullable',
        'product.order_count' => 'nullable',
        'product.special' => 'nullable',
    ];


    public function mount()
    {
        $this->product = new Product();
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
        if ($this->img) {
            $this->product->img = $this->uploadImage();
        }

        $this->product->save();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن محصول' . '-' . $this->product->title,
            'actionType' => 'ایجاد'
        ]);
        $this->emit('toast', 'success', ' محصول با موفقیت ایجاد شد.');
        return redirect(route('product.index'));
    }


    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;
        $day = now()->day;
        $directory = "product/$year/$month/$day";
        $name = $this->img->getClientOriginalName();
        $this->img->storeAs($directory, $name);
        return "$directory/$name";
    }


    public function render()
    {
        return view('livewire.admin.product.create');
    }
}
