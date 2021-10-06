@section('title','زیر دسته ها')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">

                <a class="tab__item" href="{{route('category.index')}}">
                    دسته ها
                </a>

                <a class="tab__item is-active" href="{{route('subcategory.index')}}">
                    زیر دسته ها
                </a>

                <a class="tab__item" href="{{route('childcategory.index')}}">
                    دسته های کودک
                </a>
                |
                <a class="tab__item">
                    جستجو:
                </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input type="text" class="text" placeholder="جستجوی دسته ..."
                               wire:model.debounce.1000="search">
                    </form>
                </a>

                <a class="tab__item btn btn-danger"
                   href="{{route('subcategory.trashed')}}"
                   style="color: white;float: left;margin-top: 10px;margin-left: 10px">
                    سطل زباله
                    ({{\App\Models\SubCategory::onlyTrashed()->count()}})
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
                            <th>تصویر زیر دسته</th>
                            <th>عنوان زیر دسته</th>
                            <th>نام زیر دسته</th>
                            <th>سر زیر دسته</th>
                            <th>وضعیت زیر دسته</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            <tbody>
                            @php($count = 1)
                            @foreach($categories as $category)
                                <tr role="row">
                                    <td>
                                        {{$count++}}
                                    </td>

                                    <td>
                                        <img src="{{\Illuminate\Support\Facades\Storage::url($category->img)}}"
                                             alt="img" width="50px">
                                    </td>

                                    <td>
                                        {{$category->title}}
                                    </td>

                                    <td>
                                        {{$category->name}}
                                    </td>

                                    <td>
                                        <a href="">
                                            @foreach(\App\Models\Category::where('id',$category->parent)->get() as $ca)
                                                {{$ca->title}}
                                            @endforeach
                                        </a>
                                    </td>

                                    <td>
                                        @if($category->status == 1)
                                            <button type="submit" class="badge-success badge"
                                                    style="background-color: green"
                                                    wire:click="updateCategoryDisable({{$category->id}})">
                                                فعال
                                            </button>
                                        @else
                                            <button type="submit" class="badge-danger badge"
                                                    style="background-color: red"
                                                    wire:click="updateCategoryEnable({{$category->id}})">
                                                غیرفعال
                                            </button>
                                        @endif
                                    </td>

                                    <td>
                                        <a type="submit" class="item-delete mlg-15"
                                           wire:click="deleteCategory({{$category->id}})"
                                           title="حذف">

                                        </a>
                                        <a href="{{route('subcategory.update',$category)}}" class="item-edit "
                                           title="ویرایش">
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>

                            {{$categories->render()}}

                        @else
                            <div class="alert-warning alert">
                                در حال خواندن اطلاعات از دیتابیس ...
                            </div>
                        @endif
                    </table>
                </div>
            </div>

            <div class="col-4 bg-white">
                <p class="box__title">ایجاد زیر دسته جدید</p>

                <form wire:submit.prevent="categoryForm" enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')

                    <div class="form-group">
                        <input type="text" placeholder="نام دسته " class="form-control"
                               wire:model.lazy="subcategory.title">
                    </div>

                    <div class="form-group">
                        <input type="text" placeholder="نام انگلیسی دسته " class="form-control"
                               wire:model.lazy="subcategory.name">
                    </div>

                    <div class="form-group">
                        <input type="text" placeholder="لینک دسته " class="form-control"
                               wire:model.lazy="subcategory.link">
                    </div>

                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" name="status" class="form-control"
                                   wire:model.lazy="subcategory.status">

                            <label for="option4">
                                نمایش در دسته اصلی:
                            </label>

                        </div>
                    </div>

                    <div class="form-group">
                        <select wire:model.lazy="subcategory.parent" name="parent" id="" class="form-control">
                            <option value="-1">--انتخاب دسته</option>
                            @foreach(\App\Models\Category::all() as $category)
                                <option value="{{$category->id}}">{{$category->title}}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <input type="file" wire:model.lazy="img" class="form-control">
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
                    <button class="btn btn-brand">افزودن دسته</button>
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
