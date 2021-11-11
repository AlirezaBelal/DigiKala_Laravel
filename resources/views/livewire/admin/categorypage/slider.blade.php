@section('title','اسلایدر ها')
<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item is-active" href="/admin/category/slider">اسلایدر
                </a>
                <a class="tab__item is-active" href="{{route('category.slider')}}">
                    اسلایدر
                </a>
                <a class="tab__item " href="{{route('category.amazing')}}">
                    پیشنهاد شگفت انگیز
                </a>
                <a class="tab__item " href="{{route('category.banner')}}">
                    بنر ها
                </a>
                <a class="tab__item " href="{{route('category.title')}}">
                    عنوان ها
                </a>
                <a class="tab__item " href="{{route('category.product')}}">
                    محصولات
                </a>
                <a class="tab__item" href="{{route('category.brand')}}">
                    برندهای برتر
                </a>
                |
                <a class="tab__item">
                    جستجو:
                </a>
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
                            <th>ردیف</th>
                            <th>تصویر اسلایدر</th>
                            <th>عنوان اسلایدر</th>
                            <th>لینک اسلایدر</th>
                            <th>دسته اسلایدر</th>
                            <th>وضعیت اسلایدر</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            @php($count = 1)
                            <tbody>
                            @foreach($sliders as $slider)
                                <tr role="row">
                                    <td>
                                        {{$count++}}
                                    </td>
                                    <td>
                                        <img src="{{\Illuminate\Support\Facades\Storage::url($slider->img)}}" alt="img"
                                             width="50px">
                                    </td>
                                    <td>
                                        {{$slider->title}}
                                    </td>
                                    <td><a target="_blank"
                                           href="{{url($slider->link)}}">{{\Illuminate\Support\Str::limit($slider->link,20)}}</a>
                                    </td>
                                    <td>
                                        @foreach(\App\Models\Category::where('id',$slider->c_id)->get() as $cat)
                                            {{$cat->title}}
                                        @endforeach
                                    </td>
                                    <td>
                                        @if($slider->status == 1)
                                            <button wire:click="updateCategoryDisable({{$slider->id}})"
                                                    type="submit" class="badge-success badge"
                                                    style="background-color: green">
                                                فعال
                                            </button>
                                        @else
                                            <button wire:click="updateCategoryEnable({{$slider->id}})"
                                                    type="submit" class="badge-danger badge"
                                                    style="background-color: red">
                                                غیرفعال
                                            </button>
                                        @endif
                                    </td>
                                    <td>
                                        <a wire:click="deleteCategory({{$slider->id}})" type="submit"
                                           class="item-delete mlg-15"
                                           title="حذف">
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                            {{$sliders->render()}}
                        @else
                            <div class="alert-warning alert">
                                در حال خواندن اطلاعات از دیتابیس ...
                            </div>
                        @endif
                    </table>
                </div>
            </div>
            <div class="col-4 bg-white">
                <p class="box__title">ایجاد اسلایدر جدید</p>
                <form wire:submit.prevent="categoryForm"
                      enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')

                    <div class="form-group">
                        <input type="text" wire:model.lazy="title" placeholder="نام اسلایدر "
                               class="form-control">
                    </div>

                    <div class="form-group">
                        <input type="text" wire:model.lazy="link" placeholder="لینک اسلایدر "
                               class="form-control">
                    </div>
                    <div class="form-group">
                        <select wire:model.lazy="c_id" name="c_id" id="" class="form-control">
                            <option value="-1">- دسته -</option>
                            @foreach(\App\Models\Category::all() as $category)
                                <option value="{{$category->id}}">{{$category->title}}</option>
                            @endforeach
                        </select>
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
                    <button class="btn btn-brand">افزودن اسلایدر</button>
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