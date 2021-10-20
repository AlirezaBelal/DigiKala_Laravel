<?php

namespace App\Http\Livewire\Admin\Index\Title;

use App\Models\Log;
use App\Models\TitleCategoryIndex;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public TitleCategoryIndex $index;
    public $search;
    public $readyToLoad = false;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';

    protected $rules = [
        'index.title' => 'required',
    ];


    public function mount()
    {
        $this->index = new TitleCategoryIndex();
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

        TitleCategoryIndex::query()->create([
            'title' => $this->index->title,
        ]);

        $this->index->title = '';
        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'افزودن عنوان دسته صفحه اصلی سایت' . '-' . $this->index->title,
            'actionType' => 'ایجاد'
        ]);
        $this->emit('toast', 'success', ' عنوان دسته صفحه اصلی سایت با موفقیت ایجاد شد.');
    }


    public function render()
    {

        $indexes = $this->readyToLoad ? TitleCategoryIndex::where('title', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];
        return view('livewire.admin.index.title.index', compact('indexes'));
    }
}
