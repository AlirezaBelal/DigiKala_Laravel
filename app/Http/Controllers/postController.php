<?php

namespace App\Http\Controllers;

use App\Models\NewsLetter;
use Illuminate\Http\Request;

class postController extends Controller
{
    //Register user emails
    public function newsletter(Request $request)
    {
        $newsletter = NewsLetter::where('email',$request->email)->first();
        if ($newsletter){
            alert()->error(' ایمیل شما قبلا در  خبرنامه ثبت شده است.', 'ایمیل وجود دارد.');
        }else{
            NewsLetter::create([
                'email' => $request->email
            ]);
            alert()->success(' ایمیل شما با موفقیت در خبرنامه ثبت شد.', 'با تشکر');
        }
        return back();
    }
}
