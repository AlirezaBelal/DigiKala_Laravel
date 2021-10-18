<?php

namespace App\Http\Livewire\Home\Home;

use App\Models\FooterLinkTitle;
use App\Models\NewsLetter;
use Livewire\Component;

class Index extends Component
{
    public function render()
    {

        return view('livewire.home.home.index')->layout('layouts.home');
    }
}
