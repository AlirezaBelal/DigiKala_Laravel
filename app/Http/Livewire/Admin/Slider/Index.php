<?php

namespace App\Http\Livewire\Admin\Slider;


use App\Models\Category;
use App\Models\Log;
use App\Models\Page;
use App\Models\Slider;
use App\Models\SubCategory;
use Illuminate\Support\Facades\Storage;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;

class Index extends Component
{
    use WithFileUploads;
    use WithPagination;

    public Slider $slider;
    public $img;
    public $search;
    public $readyToLoad = false;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';


    /**
     * @var string[]
     */
    protected $rules = [
        'slider.title' => 'required',
        'slider.link' => 'required',
//        'category.status' => 'nullable',
    ];


    public function mount()
    {
        $this->slider = new Slider();
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

        $slider = Slider::query()->create([
            'title' => $this->slider->title,
            'link' => $this->slider->link,
            'status' => $this->slider->status ? true : false,
        ]);

        if ($this->img) {
            $slider->update([
                'img' => $this->uploadImage()
            ]);
        }

        $this->slider->title = "";
        $this->slider->link = "";
        $this->slider->status = false;
        $this->img = null;
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن اسلایدر' . '-' . $this->slider->title,
            'actionType' => 'ایجاد'
        ]);
        $this->emit('toast', 'success', ' اسلایدر با موفقیت ایجاد شد.');
    }


    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;
        $directory = "slider/$year/$month";
        $name = $this->img->getClientOriginalName();
        $this->img->storeAs($directory, $name);
        return "$directory/$name";
    }


    public function deleteCategory($id)
    {
        $slider = Slider::find($id);
        Storage::disk('public')->delete("storage", $slider->img);
        $slider->delete();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن اسلایدر' . '-' . $slider->title,
            'actionType' => 'حذف'
        ]);
        $this->emit('toast', 'success', ' اسلایدر با موفقیت حذف شد.');

    }


    public function updateCategoryDisable($id)
    {
        $slider = Slider::find($id);
        $slider->update([
            'status' => 0
        ]);
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'غیرفعال کردن اسلایدر' . '-' . $slider->title,
            'actionType' => 'غیرفعال'
        ]);
        $this->emit('toast', 'success', 'اسلایدر با موفقیت غیرفعال شد.');
    }


    public function updateCategoryEnable($id)
    {
        $slider = Slider::find($id);
        $slider->update([
            'status' => 1
        ]);
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'فعال کردن اسلایدر' . '-' . $slider->title,
            'actionType' => 'فعال'
        ]);
        $this->emit('toast', 'success', 'اسلایدر با موفقیت فعال شد.');
    }


    public function render()
    {
        $sliders = $this->readyToLoad ? Slider::where('title', 'LIKE', "%{$this->search}%")
            ->orWhere('link', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];
        return view('livewire.admin.slider.index', compact('sliders'));
    }
}
