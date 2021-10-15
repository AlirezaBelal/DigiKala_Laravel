<?php

namespace App\Http\Livewire\Admin\Footer\Link;

use App\Models\FooterLinkTwo;
use App\Models\Log;
use Livewire\Component;

class Two extends Component
{
    public FooterLinkTwo $footerLinkTwo;
    public $readyToLoad = false;

    protected $rules = [
        'footerLinkTwo.page_id' => 'required',
    ];


    public function mount()
    {
        $this->footerLinkTwo = new FooterLinkTwo();
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

        FooterLinkTwo::query()->create([
            'page_id' => $this->footerLinkTwo->page_id,
        ]);

        $this->footerLinkTwo->page_id = "";

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن صفحه به فوتر سایت' . '-' . $this->footerLinkTwo->page_id,
            'actionType' => 'ایجاد'
        ]);
        $this->emit('toast', 'success', ' صفحه به فوتر سایت با موفقیت ایجاد شد.');
    }


    public function deleteCategory($id)
    {
        $page = FooterLinkTwo::find($id);
        $page->delete();
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'حذف کردن صفحه به فوتر سایت' . '-' . $this->footerLinkTwo->page_id,
            'actionType' => 'حذف'
        ]);
        $this->emit('toast', 'success', ' صفحه به فوتر سایت با موفقیت حذف شد.');

    }


    public function render()
    {
        $footer_links = FooterLinkTwo::latest()->get();
        return view('livewire.admin.footer.link.two', compact('footer_links'));
    }
}
