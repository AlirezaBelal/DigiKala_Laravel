<?php

namespace App\Http\Livewire\Admin\Category;

use App\Models\Category;
use Livewire\Component;
use Livewire\WithFileUploads;
use function Symfony\Component\Translation\t;

class Index extends Component
{
    use WithFileUploads;

    public $img;

    public Category $category;

    public function mount(){

        $this->category = new Category();
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
//        dd($this->img);
        $this->category->img = $this->uploadImage();
        $this->category->save();

        if(! $this->category->status){
            $this->category->update([
                'status' => 0
            ]);
        }
        $this->emit('toast','success',' دسته با موفقیت ایجاد شد.');
    }

    public function render()
    {
        $categories = Category::all();

        return view('livewire.admin.category.index' , compact('categories'));
    }

    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;

        $directory = "category/$year/$month";

        $name = $this->img->getClientOriginalName();

        $this->img->storeAs($directory,$name);

        return "$directory/$name";
    }

    public function updateCategoryDisable($id)
    {
//        dd($id);

        $category = Category::find($id);

        $category->update([
            "status" => 0
        ]);

        $this->emit('toast','success','وضعیت دسته با موفقیت غیر فعال شد.');
    }

    public function updateCategoryEnable($id)
    {
//        dd($id);

        $category = Category::find($id);

        $category->update([
            "status" => 1
        ]);

        $this->emit('toast','success','وضعیت دسته با موفقیت فعال شد.');
    }

    public function deleteCategory($id)
    {
//        dd($id);

        $category = Category::find($id);
        $category->delete();

        $this->emit('toast','success','دسته با موفقیت حذف شد');

    }


}
