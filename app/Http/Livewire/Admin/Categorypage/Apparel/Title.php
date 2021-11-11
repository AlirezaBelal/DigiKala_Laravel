<?php

namespace App\Http\Livewire\Admin\Categorypage\Apparel;

use App\Models\Log;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithPagination;

class Title extends Component
{
    use WithPagination;

    public $title;
    public $link;
    public $search;
    public $readyToLoad = false;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';


    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


    public function categoryForm()
    {
        $titles = DB::connection('mysql-apparel')
            ->table('category_apparel_title_swiper')
            ->insert([
                'title' => $this->title,
                'link' => $this->link,
            ]);

        $this->title = "";
        $this->link = "";

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن عناوین' . '-' . $this->title,
            'actionType' => 'ایجاد'
        ]);

        $this->emit('toast', 'success', ' عناوین با موفقیت ایجاد شد.');
    }


    public function deleteCategory($id)
    {
        $banner2 = DB::connection('mysql-apparel')
            ->table('category_apparel_title_swiper')
            ->where('id', $id)
            ->first();

        $banner = DB::connection('mysql-apparel')
            ->table('category_apparel_title_swiper')
            ->where('id', $id)
            ->limit($id);

        $banner->delete();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن عناوین' . '-' . $banner2->title,
            'actionType' => 'حذف'
        ]);

        $this->emit('toast', 'success', ' عناوین با موفقیت حذف شد.');
    }

    public function render()
    {

        $titles = $this->readyToLoad ? DB::connection('mysql-apparel')
            ->table('category_apparel_title_swiper')
            ->where('title', 'LIKE', "%{$this->search}%")
            ->latest()
            ->paginate(10) : [];
        return view('livewire.admin.categorypage.apparel.title', compact('titles'));
    }
}