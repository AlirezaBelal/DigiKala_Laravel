<?php

namespace App\Http\Livewire\Admin\Footer\Link;


use App\Models\FooterLinkThree;
use App\Models\Log;
use Livewire\Component;

class Three extends Component
{
    public FooterLinkThree $footerLinkThree;
    public $readyToLoad = false;

    protected $rules = [
        'footerLinkThree.page_id' => 'required',
    ];


    public function mount()
    {
        $this->footerLinkThree = new FooterLinkThree();
    }


    /**
     * @throws \Illuminate\Validation\ValidationException
     */
    public function updated($page_id)
    {
        $this->validateOnly($page_id);
    }


    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


    public function categoryForm()
    {
        $this->validate();

        FooterLinkThree::query()->create([
            'page_id' => $this->footerLinkThree->page_id,
        ]);

        $this->footerLinkThree->page_id = "";

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن صفحه به فوتر سایت' . '-' . $this->footerLinkThree->page_id,
            'actionType' => 'ایجاد'
        ]);

        $this->emit('toast', 'success', ' صفحه به فوتر سایت با موفقیت ایجاد شد.');
    }


    public function deleteCategory($id)
    {
        $page = FooterLinkThree::find($id);

        $page->delete();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن صفحه به فوتر سایت' . '-' . $this->footerLinkThree->page_id,
            'actionType' => 'حذف'
        ]);

        $this->emit('toast', 'success', ' صفحه به فوتر سایت با موفقیت حذف شد.');
    }


    public function render()
    {
        $footer_links = FooterLinkThree::latest()->get();
        return view('livewire.admin.footer.link.three', compact('footer_links'));
    }
}
