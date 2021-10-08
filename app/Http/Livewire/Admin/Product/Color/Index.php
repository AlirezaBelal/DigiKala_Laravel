<?php

namespace App\Http\Livewire\Admin\Product\Color;

use App\Models\Color;
use App\Models\Log;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public $search;
    public $readyToLoad = false;
    public Color $color;


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
        'color.name' => 'required',
        'color.value' => 'required',
        'color.status' => 'nullable',
    ];


    public function mount()
    {
        $this->color = new Color();
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

        if (!$this->color->status) {
            $this->color->status = 0;
        }
        $this->color->save();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن رنگ' . '-' . $this->category->name,
            'actionType' => 'ایجاد'
        ]);

        $this->emit('toast', 'success', ' رنگ با موفقیت ایجاد شد.');
    }


    public function updateCategoryDisable($id)
    {
        $color = Color::find($id);
        $color->update([
            'status' => 0
        ]);

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'غیرفعال کردن وضعیت رنگ' . '-' . $this->color->name,
            'actionType' => 'غیرفعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت رنگ با موفقیت غیرفعال شد.');
    }


    public function updateCategoryEnable($id)
    {
        $brand = Color::find($id);
        $brand->update([
            'status' => 1
        ]);

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'فعال کردن وضعیت رنگ' . '-' . $this->color->name,
            'actionType' => 'فعال'
        ]);

        $this->emit('toast', 'success', 'وضعیت رنگ با موفقیت فعال شد.');
    }


    public function deleteCategory($id)
    {
        $color = Color::find($id);
        $color->delete();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن رنگ' . '-' . $this->color->name,
            'actionType' => 'حذف'
        ]);

        $this->emit('toast', 'success', ' رنگ با موفقیت حذف شد.');
    }


    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * Reload this Page
     */
    public function render()
    {
        $colors = $this->readyToLoad ? Color::Where('name', 'LIKE', "%{$this->search}%")
            ->orWhere('value', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];
        return view('livewire.admin.product.color.index' , compact('colors'));
    }
}
