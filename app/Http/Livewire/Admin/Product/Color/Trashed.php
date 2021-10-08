<?php

namespace App\Http\Livewire\Admin\Product\Color;

use App\Models\Brand;
use App\Models\Color;
use App\Models\Log;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithPagination;

class Trashed extends Component
{
    use WithPagination;


    public $search;
    public $readyToLoad = false;

    protected $queryString = ['search'];
    protected $paginationTheme = 'bootstrap';


    public function loadCategory()
    {
        $this->readyToLoad = true;
    }


    public function trashedCategory($id)
    {
        $color = Color::withTrashed()->where('id', $id)->first();
        $color->restore();

        Log::create([
            'user_id' => auth()->user()->id,
            'url' => 'بازیابی رنگ' . '-' . $color->name,
            'actionType' => 'بازیابی'
        ]);

        $this->emit('toast', 'success', ' رنگ با موفقیت بازیابی شد.');
    }


    public function render()
    {

        $colors = $this->readyToLoad ? DB::table('colors')
            ->whereNotNull('deleted_at')
            ->latest()->paginate(10) : [];
        return view('livewire.admin.product.color.trashed' , compact('colors'));
    }
}
