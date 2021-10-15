@section('title','عنوان صفحات فوتر لینک سایت')
<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item " href="{{route('footer.index')}}">
                    صفحات بالای فوتر سایت
                </a>
                <a class="tab__item  " href="{{route('footer.link_1')}}">
                    فوتر لینک یک
                </a>
                <a class="tab__item " href="{{route('footer.link_2')}}">
                    فوتر لینک دو
                </a>
                <a class="tab__item " href="{{route('footer.link_3')}}">
                    فوتر لینک سه
                </a>
                <a class="tab__item " href="{{route('footer_page_title.index')}}">
                    عنوان صفحات فوتر لینک سایت
                </a>
                <a class="tab__item is-active" href="{{route('footer_title.index')}}">
                    عناوین اصلی فوتر سایت
                </a>
                <a class="tab__item " href="{{route('footer.partner')}}">
                    صفحات پایین فوتر سایت
                </a>
            </div>
        </div>

        <div class="row">
            <div class="col-8 margin-left-10 margin-bottom-15 border-radius-3">
                <div class="table__box">
                    <table class="table">

                        <thead role="rowgroup">
                        <tr role="row" class="title-row">
                            <th>ردیف</th>
                            <th>عنوان صفحه سایت</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            @php($count = 1)
                            <tbody>
                            @foreach($footer_titles as $footer_title)
                                <tr role="row">
                                    <td>
                                        {{$count++}}
                                    </td>

                                    <td>
                                        {{\Illuminate\Support\Str::limit($footer_title->title,120)}}
                                    </td>

                                    <td>
                                        <a href="{{route('footer_title.update',$footer_title)}}" class="item-edit "
                                           title="ویرایش">
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        @else
                            <div class="alert-warning alert">
                                در حال خواندن اطلاعات از دیتابیس ...
                            </div>
                        @endif
                    </table>
                </div>
            </div>

            <div class="col-4 bg-white">
                <p class="box__title">ایجاد عنوان جدید</p>
                <form wire:submit.prevent="categoryForm"
                      enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')

                    <div class="form-group">
                        <div class="form-group">
                            <input type="text" wire:model.lazy="footerTitle.title"
                                   placeholder="عنوان فوتر را وارد کنید(یا شماره آیدی دسته کودک را وارد کنید)"
                                   class="form-control">
                        </div>
                    </div>

                    <button class="btn btn-brand">افزودن صفحه سایت</button>
                </form>
            </div>
        </div>
    </div>
</div>
