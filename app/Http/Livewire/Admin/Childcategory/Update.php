<?php

namespace App\Http\Livewire\Admin\Childcategory;

use App\Models\ChildCategory;
use App\Models\SubCategory;
use Livewire\Component;
use Livewire\WithFileUploads;

class Update extends Component
{
    use WithFileUploads;


    public $img;


    public ChildCategory $childcategory;


    protected $rules = [
        'childcategory.title' => 'required|min:3',
        'childcategory.name' => 'required',
        'childcategory.link' => 'required',
        'childcategory.status' => 'nullable',
        'childcategory.parent' => 'nullable',
    ];


    public function categoryForm()
    {
        $this->validate();

        if ($this->img){
            $this->childcategory->img = $this->uploadImage();
        }

        $this->childcategory->update($this->validate());

        if (!$this->childcategory->status) {
            $this->childcategory->update([
                'status' => 0
            ]);
        }
        $this->emit('toast', 'success', ' دسته کودک با موفقیت ایجاد شد.');

        return redirect(route('subcategory.index'));
    }


    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;

        $directory = "childcategory/$year/$month";

        $name = $this->img->getClientOriginalName();

        $this->img->storeAs($directory, $name);

        return "$directory/$name";
    }


    public function render()
    {
//        dd($this->subcategory);
        $childcategory = $this->childcategory;
        return view('livewire.admin.childcategory.update' , compact('childcategory'));
    }
}
