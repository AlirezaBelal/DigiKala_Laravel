@section('title','اسلایدر های دسته الکترونیک')
<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item " href="/admin/category/electronic/slider">اسلایدر
                </a>
                <a class="tab__item "
                   href="/admin/category/electronic/amazing">پیشنهاد شگفت انگیز </a>
                <a class="tab__item is-active"
                   href="/admin/category/electronic/banner">بنر ها </a>
                <a class="tab__item "
                   href="/admin/category/electronic/title">عنوان ها </a>
                <a class="tab__item"
                   href="/admin/category/electronic/product">محصولات </a>
                |
                <a class="tab__item">جستجو: </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input wire:model.debounce.1000="search"
                               type="text" class="text" placeholder="جستجوی اسلایدر ...">
                    </form>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-8 margin-left-10 margin-bottom-15 border-radius-3">

                <div class="table__box">
                    <table class="table">

                        <thead role="rowgroup">
                        <tr role="row" class="title-row">
                            <th>آیدی</th>
                            <th>تصویر بنر</th>
                            <th>عنوان بنر</th>
                            <th>لینک بنر</th>
                            <th>نوع بنر</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            <tbody>
                            @foreach($banners as $banner)
                                <tr role="row">
                                    <td><a href="">{{$banner->id}}</a></td>
                                    <td>
                                        <img src="/storage/{{$banner->img}}" alt="img" width="100px">
                                    </td>
                                    <td><a href="">{{$banner->title}}</a></td>
                                    <td><a target="_blank"
                                           href="{{url($banner->link)}}">{{\Illuminate\Support\Str::limit($banner->link,20)}}</a>
                                    </td>
                                    <td>@if($banner->type== 1)
                                            <span class="alert alert-danger ">سایز بزرگ</span>
                                        @else
                                            <span class="alert alert-primary"> سایز کوچک</span>

                                        @endif
                                    </td>
                                    <td>
                                        <a wire:click="deleteCategory({{$banner->id}})" type="submit"
                                           class="item-delete mlg-15" title="حذف"></a>
                                    </td>
                                </tr>
                            @endforeach

                            </tbody>
                            {{$banners->render()}}
                        @else



                            <div class="alert-warning alert">
                                در حال خواندن اطلاعات از دیتابیس ...
                            </div>


                        @endif


                    </table>
                </div>


            </div>
            <div class="col-4 bg-white">
                <p class="box__title">ایجاد بنر جدید</p>
                <form wire:submit.prevent="categoryForm"
                      enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')


                    <div class="form-group">
                        <input type="text" wire:model.lazy="title" placeholder="نام بنر "
                               class="form-control">
                    </div>

                    <div class="form-group">
                        <input type="text" wire:model.lazy="link" placeholder="لینک بنر "
                               class="form-control">
                    </div>

                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" wire:model.lazy="type" name="type"
                                   class="form-control">
                            <label for="option4">بنر سایز بزرگ:</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="file" wire:model.lazy="img" id="{{rand()}}" class="form-control">
                        <span class="mt-2 text-danger" wire:loading wire:target="img">در حال آپلود ...</span>

                        <div wire:ignore class="progress mt-2" id="progressbar" style="display: none">
                            <div class="progress-bar" role="progressbar" style="width: 0%;">0%</div>
                        </div>
                    </div>
                    <div>
                        @if($img)
                            <img class="form-control mt-3 mb-3" width="400" src="{{$img->temporaryUrl()}}" alt="">
                        @endif
                    </div>

                    <button class="btn btn-brand">افزودن بنر</button>
                </form>
            </div>
        </div>


    </div>

    <script>
        document.addEventListener('livewire:load', () => {
            let progressSection = document.querySelector('#progressbar'),
                progressBar = progressSection.querySelector('.progress-bar');

            document.addEventListener('livewire-upload-start', () => {
                console.log('شروع آپلود');
                progressSection.style.display = 'flex';
            });
            document.addEventListener('livewire-upload-finish', () => {
                console.log('اتمام آپلود');
                progressSection.style.display = 'none';
            });
            document.addEventListener('livewire-upload-error', () => {
                console.log('ارور موقع آپلود');
                progressSection.style.display = 'none';
            });
            document.addEventListener('livewire-upload-progress', (event) => {
                console.log(`${event.detail.progress}%`);
                progressBar.style.width = `${event.detail.progress}%`;
                progressBar.textContent = `${event.detail.progress}%`;
            });

        });
    </script>
</div>

