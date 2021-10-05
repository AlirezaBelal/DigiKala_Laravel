<?php

namespace App\Http\Livewire\Admin\Category;

use App\Models\Category;
use App\Models\Log;
use Livewire\Component;
use Livewire\WithFileUploads;

class Update extends Component
{
    use WithFileUploads;

    public $img;
    public Category $category;

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


    /**
     * Enter information in the database
     */
    public function categoryForm()
    {
        $this->validate();
        if ($this->img) {
            $this->category->img = $this->uploadImage();
        }
        if (!$this->category->status) {
            $this->category->update([
                'status' => 0
            ]);
        }

        $this->category->update($this->validate());

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'آپدیت دسته' .'-'. $this->category->title,
            'actionType' => 'آپدیت'
        ]);

        $this->emit('toast', 'success', ' دسته با موفقیت ایجاد شد.');
        return redirect(route('category.index'));
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


    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * Reload this Page
     */
    public function render()
    {
        $category = $this->category;
        return view('livewire.admin.category.update',compact('category'));
    }
}
