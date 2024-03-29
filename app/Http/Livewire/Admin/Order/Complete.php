<?php

namespace App\Http\Livewire\Admin\Order;

use App\Models\Order;
use Livewire\Component;
use Livewire\WithPagination;

class Complete extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public $search;

    protected $queryString = ['search'];

    //
    public function render()
    {
        $orders = Order::where('status', 'delivered')->latest()->paginate(20);

        return view('livewire.admin.order.complete', compact('orders'));
    }
}
