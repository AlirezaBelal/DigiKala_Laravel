@section('title','آپدیت عنوان صفحه سایت')
<div>
    <div class="main-content padding-0">
        <div class="row no-gutters bg-white">
            <div class="col-8">
                <form wire:submit.prevent="categoryForm"
                      enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')
                    <div class="form-group">
                        <select wire:model.lazy="footer_page.page_id" name="page_id" id="" class="form-control">
                            <option value="-1">- انتخاب صفحه برای فوتر -</option>
                            @foreach(\App\Models\Page::all() as $page)
                                <option value="{{$page->id}}">{{$page->title}}</option>
                            @endforeach
                        </select>
                    </div>

                    <button type="submit" class="btn btn-brand">آپدیت عنوان صفحه سایت</button>
                </form>
            </div>
        </div>
    </div>
</div>
