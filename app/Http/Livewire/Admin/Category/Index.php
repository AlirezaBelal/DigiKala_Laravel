<?php

namespace App\Http\Livewire\Admin\Category;

use App\Models\Category;
use Livewire\Component;

class Index extends Component
{
    public function render()
    {
        $categories = Category::all();

        return view('livewire.admin.category.index' , compact('categories'));
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
