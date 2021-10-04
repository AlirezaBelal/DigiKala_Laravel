@section('title','سطل زباله دسته ها')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">

                {{--/admin/category--}}
                <a class="tab__item " href="{{route('category.index')}}">
                    دسته ها
                </a>

                {{--/admin/subcategory--}}
                <a class="tab__item " href="{{route('subcategory.index')}}">
                    زیر دسته ها
                </a>

                {{--/admin/childcategory--}}
                <a class="tab__item is-active" href="{{route('childcategory.index')}}">
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
                   href="{{route('childcategory.trashed')}}"
                   style="color: white;float: left;margin-top: 10px;margin-left: 10px">
                    سطل زباله
                    ({{\App\Models\ChildCategory::onlyTrashed()->count()}})
                </a>
            </div>
        </div>

        <div class="row">
            <div class="col-12 margin-left-10 margin-bottom-15 border-radius-3">

                <div class="table__box">
                    <table class="table">

                        <thead role="rowgroup">
                        <tr role="row" class="title-row">
                            <th>آیدی</th>
                            <th>تصویر دسته</th>
                            <th>عنوان دسته</th>
                            <th>نام دسته</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            <tbody>
                            @foreach($categories as $category)
                                <tr role="row">
                                    <td>
                                        <a href="">{{$category->id}}</a>
                                    </td>

                                    <td>
                                        <img src="/storage/{{$category->img}}" alt="img" width="100px">
                                    </td>

                                    <td>
                                        <a href="">{{$category->title}}</a>
                                    </td>

                                    <td>
                                        <a href="">{{$category->name}}</a>
                                    </td>

                                    <td>
                                        <a type="submit" class="item-delete mlg-15"
                                           wire:click="deleteCategory({{$category->id}})"
                                           title="حذف">
                                        </a>

                                        <a class="item-li i-checkouts item-restore"
                                           wire:click="trashedCategory({{$category->id}})">
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
        </div>
    </div>
</div>
