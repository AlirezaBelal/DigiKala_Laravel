<?php

namespace App\Http\Livewire\Admin\Log;

use App\Models\Category;
use Illuminate\Support\Facades\Log;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public $img;
    public $search;
    public $readyToLoad = false;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';


    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


    public function render()
    {

        $logs = $this->readyToLoad ? \App\Models\Log::where('actionType', 'LIKE', "%{$this->search}%")
            ->orWhere('user_id', 'LIKE', "%{$this->search}%")
            ->orWhere('url', 'LIKE', "%{$this->search}%")
            ->latest()->paginate(10) : [];
        return view('livewire.admin.log.index', compact('logs'));
    }
}
