<?php

namespace App\Http\Livewire\Admin\Subcategory;

use App\Models\Category;
use App\Models\SubCategory;
use Livewire\Component;
use Livewire\WithFileUploads;

class Update extends Component
{
    use WithFileUploads;

    public SubCategory $subcategory;
    public $img;

    protected $rules = [
        'subcategory.title' => 'required|min:3',
        'subcategory.name' => 'required',
        'subcategory.link' => 'required',
        'subcategory.status' => 'nullable',
        'subcategory.parent' => 'nullable',
    ];


    public function categoryForm()
    {
        $this->validate();
        if ($this->img){
            $this->subcategory->img = $this->uploadImage();
        }

        $this->subcategory->update($this->validate());
        if (!$this->subcategory->status) {
            $this->subcategory->update([
                'status' => 0
            ]);
        }

        $this->emit('toast', 'success', ' دسته با موفقیت ایجاد شد.');

        return redirect(route('subcategory.index'));

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


    public function render()
    {
        $subcategory = $this->subcategory;
        return view('livewire.admin.subcategory.update',compact('subcategory'));
    }
}