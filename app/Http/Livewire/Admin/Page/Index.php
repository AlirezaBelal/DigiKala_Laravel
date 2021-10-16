<?php

namespace App\Http\Livewire\Admin\Page;

use App\Models\Brand;
use App\Models\Log;
use App\Models\Page;
use App\Models\Product;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;

class Index extends Component
{
    use WithFileUploads;
    use WithPagination;

    public Page $site_page;
    public $img;
    public $search;
    public $readyToLoad = false;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';

    protected $rules = [
        'site_page.title' => 'required',
        'site_page.link' => 'required',
    ];


    public function mount()
    {
        $this->site_page = new Page();
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

        $page = Page::query()->create([
            'title' => $this->site_page->title,
            'link' => $this->site_page->link,
        ]);

        if ($this->img){
            $page->update([
                'img' => $this->uploadImage()
            ]);
        }

        $this->site_page->title = "";
        $this->site_page->link = "";
        $this->img = null;
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن صفحه سایت' .'-'. $this->site_page->title,
            'actionType' => 'ایجاد'
        ]);
        $this->emit('toast', 'success', ' صفحه سایت با موفقیت ایجاد شد.');
    }

    public function uploadImage()
    {
        $year = now()->year;
        $month = now()->month;
        $directory = "page/$year/$month";
        $name = $this->img->getClientOriginalName();
        $this->img->storeAs($directory, $name);
        return "$directory/$name";
    }


    public function deleteCategory($id)
    {
        $page = Page::find($id);
        $page->delete();
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن صفحه سایت' .'-'. $this->site_page->title,
            'actionType' => 'حذف'
        ]);
        $this->emit('toast', 'success', ' صفحه سایت با موفقیت حذف شد.');
    }


    public function render()
    {

        $pages = $this->readyToLoad ? Page::where('title', 'LIKE', "%{$this->search}%")->
        orWhere('link', 'LIKE', "%{$this->search}%")->
        orWhere('id', $this->search)->
        latest()->paginate(10) : [];
        return view('livewire.admin.page.index',compact('pages'));
    }
}
