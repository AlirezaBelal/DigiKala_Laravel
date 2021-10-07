@section('title','برند های محصولات')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">

                <a class="tab__item is-active" href="{{route('brand.index')}}">
                    برند ها
                </a>
                |
                <a class="tab__item">
                    جستجو:
                </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input type="text" class="text" placeholder="جستجوی برند ..."
                               wire:model.debounce.1000="search">
                    </form>
                </a>

                <a class="tab__item btn btn-danger"
                   href="{{route('brand.trashed')}}"
                   style="color: white;float: left;margin-top: 10px;margin-left: 10px">
                    سطل زباله
                    ({{\App\Models\Brand::onlyTrashed()->count()}})
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
                            <th>تصویر برند</th>
                            <th>نام برند</th>
                            <th>دسته برند</th>
                            <th>وضعیت برند</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            <tbody>
                            @php($count = 1)
                            @foreach($brands as $brand)
                                <tr role="row">
                                    <td>
                                        <p>{{$count++}}<p>
                                    </td>

                                    <td>
                                        <img src="{{\Illuminate\Support\Facades\Storage::url($brand->img)}}"
                                             alt="img" width="50px">
                                    </td>

                                    <td>
                                        {{$brand->name}}
                                    </td>

                                    <td>
                                    <a href="">
                                        @foreach(\App\Models\Category::where('id',$brand->parent)->get() as $ca)
                                            {{$ca->title}}
                                        @endforeach
                                    </a>
                                    </td>

                                    <td>
                                        @if($brand->status == 1)
                                            <button type="submit" class="badge-success badge"
                                                    style="background-color: green"
                                                    wire:click="updateCategoryDisable({{$brand->id}})">
                                                فعال
                                            </button>
                                        @else
                                            <button type="submit" class="badge-danger badge"
                                                    style="background-color: red"
                                                    wire:click="updateCategoryEnable({{$brand->id}})">
                                                غیرفعال
                                            </button>
                                        @endif
                                    </td>

                                    <td>
                                        <a type="submit" class="item-delete mlg-15"
                                           wire:click="deleteCategory({{$brand->id}})"
                                           title="حذف">
                                        </a>

                                        <a class="item-edit "
                                           href="{{route('brand.update',$brand)}}"
                                           title="ویرایش">
                                        </a>

                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                            {{$brands->render()}}

                        @else
                            <div class="alert-warning alert">
                                در حال خواندن اطلاعات از دیتابیس ...
                            </div>
                        @endif

                    </table>
                </div>
            </div>

            <div class="col-4 bg-white">
                <p class="box__title">ایجاد برند بندی جدید</p>

                <form wire:submit.prevent="categoryForm" enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')

                    <div class="form-group">
                        <input type="text" placeholder="نام برند " class="form-control"
                               wire:model.lazy="brand.name">
                    </div>

                    <div class="form-group">
                        <input type="text" placeholder="لینک برند " class="form-control"
                               wire:model.lazy="brand.link">
                    </div>

                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" name="status" class="form-control"
                                   wire:model.lazy="brand.status">

                            <label for="option4">
                                نمایش در برند اصلی:
                            </label>

                        </div>

                        <div class="form-group">
                            <select wire:model.lazy="brand.parent" name="parent" id="" class="form-control">
                                <option value="-1">--انتخاب دسته</option>
                                @foreach(\App\Models\Category::all() as $category)
                                    <option value="{{$category->id}}">{{$category->title}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <textarea type="text" placeholder="توضیح برند " class="form-control"
                                   wire:model.lazy="brand.description">
                            </textarea>
                        </div>
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
                    <button class="btn btn-brand">افزودن برند</button>
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
