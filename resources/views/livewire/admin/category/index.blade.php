@section('title' , 'دسته ها')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item {{Request::routeIs('category.index') ? 'is-active' : ''}}" href="/admin/category">دسته
                    ها</a>
                <a class="tab__item {{Request::routeIs('subcategory.index') ? 'is-active' : ''}}"
                   href="/admin/subcategory">زیردسته ها</a>
                <a class="tab__item {{Request::routeIs('childcategory.index') ? 'is-active' : ''}}"
                   href="/admin/childcategory">دسته های کودک</a>

                |

                <a class="tab__item">جستجو دسته ها</a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input wire:model.debounce.1000="search"
                               type="text" class="text" placeholder="جستجوی دسته ... ">
                    </form>
                </a>

                <a class="tab__item btn btn-danger"
                   href="{{route('category.trashed')}}" style="color: white;float: left; margin-top: 10px;margin-left: 10px">
                    سطل زباله
                ({{\App\Models\Category::onlyTrashed()->count()}})
                </a>
            </div>

        </div>

        <div class="row">
            <div class="col-8 margin-left-10 margin-bottom-15 border-radius-3">

                <div class="table__box">
                    <table class="table">

                        <thead role="rowgroup">
                        <tr role="row" class="title-row">
                            <th>شناسه آیدی</th>
                            <th>تصویر دسته</th>
                            <th>نام دسته</th>
                            <th>عنوان دسته</th>
                            <th>وضعیت دسته</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readToLoad)
                            <tbody>
                        @foreach($categories as $category)
                            <tr role="row">
                                <td><a href="">{{$category->id}}</a></td>
                                <td>
                                    <img src="/storage/{{$category->img}}" width="50px">
                                </td>
                                <td><a href="">{{$category->title}}</a></td>
                                <td><a href="">{{$category->name}}</a></td>
                                <td>
                                    @if($category->status == 1)
                                        <button
                                            wire:click="updateCategoryDisable({{$category->id}})"
                                            type="submit" class="badge-success badge" style="background-color: green">
                                            فعال
                                        </button>

                                    @else
                                        <button
                                            wire:click="updateCategoryEnable({{$category->id}})"
                                            type="submit" class="badge-danger badge" style="background-color: red">
                                            غیرفعال
                                        </button>
                                    @endif
                                </td>

                                <td>
                                    <a
                                        wire:click="deleteCategory({{$category->id}})"
                                        type="submit" class="item-delete mlg-15" title="حذف"></a>
                                    <a href="{{route('category.update' , $category)}}" class="item-edit " title="ویرایش"></a>
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
                <p class="box__title">ایجاد دسته بندی جدید</p>

                <form wire:submit.prevent="categoryForm" class="padding-15"
                      enctype="multipart/form-data" role="form">


                    @include('errors.error')
                    <div class="form-group">
                        <input type="text" wire:model.lazy="category.title" placeholder="نام دسته" class="form-control">
                    </div>

                    <div class="form-group">
                        <input type="text" wire:model.lazy="category.name" placeholder="نام انگلیسی دسته"
                               class="form-control">
                    </div>

                    <div class="form-group">
                        <input type="text" wire:model.lazy="category.link" placeholder="لینک دسته" class="form-control">
                    </div>

                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" wire:model.lazy="category.status" name="status"
                                   class="form-control">
                            <label for="option4">نمایش در دسته اصلی:</label>
                        </div>

                    </div>

                    <div class="form-group">
                        <input type="file" wire:model.lazy="img" class="form-control">
                        <span class="m-2 text-danger" wire:loading wire:target="img">
                            در حال آپلود ...
                        </span>
                        <div wire:ignore class="progress mt-3" id="progressbar" style="display: none">
                            <div class="progress-bar" role="progressbar" style="width: 0%;">0%</div>
                        </div>
                    </div>

                    <div>
                        @if($img)
                            <img class="form-control mt-3" width="250px" src="{{$img->temporaryUrl()}}" alt="">
                        @endif
                    </div>

                    <button class="btn btn-brand mt-3">افزودن دسته</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('livewire:load', () => {
            let progressSection = document.querySelector('#progressbar'),
                progressBar = progressSection.querySelector('.progress-bar');


            document.addEventListener('livewire-upload-start', () => {
                console.log('شروع آپلود')
                progressSection.style.display = 'flex';
            });

            document.addEventListener('livewire-upload-finish', () => {
                console.log('اتمام آپلود')
                progressSection.style.display = 'none';
            });

            document.addEventListener('livewire-upload-error', () => {
                console.log('خطای آپلود')
                progressSection.style.display = 'none';
            });

            document.addEventListener('livewire-upload-progress', (event) => {
                console.log(`${event.detail.progress}%`)
                progressBar.style.width = `${event.detail.progress}%`;
                progressBar.textContent = `${event.detail.progress}%`;
            });

        })
    </script>
</div>

