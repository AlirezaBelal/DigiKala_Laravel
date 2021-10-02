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
                                            wire:click = "updateCategoryDisable({{$category->id}})"
                                            type="submit" class="badge-success badge" style="background-color: green">
                                            فعال
                                        </button>

                                    @else
                                        <button
                                            wire:click = "updateCategoryEnable({{$category->id}})"
                                            type="submit" class="badge-danger badge" style="background-color: red">
                                            غیرفعال
                                        </button>
                                    @endif
                            </td>

                            <td>
                                <a
                                    wire:click = "deleteCategory({{$category->id}})"
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
                <form action="" method="post" class="padding-30">
                    <input type="text" placeholder="نام دسته بندی" class="text">
                    <input type="text" placeholder="نام انگلیسی دسته بندی" class="text">
                    <p class="box__title margin-bottom-15">انتخاب دسته پدر</p>
                    <select name="" id="">
                        <option value="0">ندارد</option>
                        <option value="0">برنامه نویسی</option>
                    </select>
                    <div class="dropdown-select wide " tabindex="0"><span class="current">ندارد</span>
                        <div class="list">
                            <div class="dd-search"><input id="txtSearchValue" autocomplete="off" onkeyup="filter()"
                                                          class="dd-searchbox" type="text"></div>
                            <ul>
                                <li class="option selected" data-value="0" data-display-text="">ندارد</li>
                                <li class="option " data-value="0" data-display-text="">برنامه نویسی</li>
                            </ul>
                        </div>
                    </div>
                    <button class="btn btn-brand">اضافه کردن</button>
                </form>
            </div>
        </div>
    </div>
</div>

