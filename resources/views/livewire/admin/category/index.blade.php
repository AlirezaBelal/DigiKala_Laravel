@section('title' , 'دسته ها')

<div>
    <div class="main-content">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item {{Request::routeIs('category.index') ? 'is-active' : ''}}" href="/admin/category">دسته
                    ها</a>
                <a class="tab__item {{Request::routeIs('subcategory.index') ? 'is-active' : ''}}"
                   href="/admin/subcategory">زیردسته ها</a>
                <a class="tab__item {{Request::routeIs('chidcategory.index') ? 'is-active' : ''}}"
                   href="/admin/chidcategory">دسته های کودک</a>

                |

                <a class="tab__item">جستجو دسته ها</a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input type="text" class="text" placeholder="جستجوی دسته ... ">
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
                            <th>شناسه آیدی</th>
                            <th>نام دسته</th>
                            <th>عنوان دسته</th>
                            <th>وضعیت دسته</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($categories as $category)
                            <tr role="row">
                                <td><a href="">{{$category->id}}</a></td>
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
                                    <a href="" class="item-edit " title="ویرایش"></a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-4 bg-white">
                <p class="box__title">ایجاد دسته بندی جدید</p>
                <form wir:submit="categoryForm" class="padding-15">
                    <div class="form-group">
                        <input type="text" wire:model.lazy="title" placeholder="نام دسته" class="form-control">
                    </div>

                    <div class="form-group">
                        <input type="text" wire:model.lazy="name" placeholder="نام انگلیسی دسته" class="form-control">
                    </div>

                    <div class="form-group">
                        <input type="text" wire:model.lazy="link" placeholder="لینک دسته" class="form-control">
                    </div>

                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" wire:model.lazy="status" name="status" class="form-control">
                            <label for="option4">نمایش در دسته اصلی:</label>
                        </div>

                    </div>

                    <div class="form-group">
                        <input type="file" class="form-control">
                    </div>
                    <br>
                    <button class="btn btn-brand">افزودن دسته</button>
                </form>
            </div>
        </div>
    </div>
</div>

