@section('title','رنگ های محصولات')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">

                <a class="tab__item" href="{{route('product.index')}}">
                    محصولات
                </a>

                <a class="tab__item is-active" href="{{route('color.index')}}">
                    رنگ های محصولات
                </a>
                |
                <a class="tab__item">
                    جستجو:
                </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input type="text" class="text" placeholder="جستجوی رنگ ..."
                               wire:model.debounce.1000="search">
                    </form>
                </a>

                <a class="tab__item btn btn-danger"
                   href="{{route('color.trashed')}}"
                   style="color: white;float: left;margin-top: 10px;margin-left: 10px">
                    سطل زباله
                    ({{\App\Models\Color::onlyTrashed()->count()}})
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
                            <th>نام رنگ</th>
                            <th>کد رنگ</th>
                            <th>وضعیت رنگ</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            <tbody>
                            @php($count = 1)
                            @foreach($colors as $color)
                                <tr role="row">
                                    <td>
                                        <p>{{$count++}}<p>
                                    </td>

                                    <td>
                                        {{$color->name}}
                                    </td>

                                    <td>
                                        <span style="background-color: {{$color->color}}">{{$color->color}}</span>
                                    </td>

                                    <td>
                                        @if($color->status == 1)
                                            <button type="submit" class="badge-success badge"
                                                    style="background-color: green"
                                                    wire:click="updateCategoryDisable({{$color->id}})">
                                                فعال
                                            </button>
                                        @else
                                            <button type="submit" class="badge-danger badge"
                                                    style="background-color: red"
                                                    wire:click="updateCategoryEnable({{$color->id}})">
                                                غیرفعال
                                            </button>
                                        @endif
                                    </td>

                                    <td>
                                        <a type="submit" class="item-delete mlg-15"
                                           wire:click="deleteCategory({{$color->id}})"
                                           title="حذف">
                                        </a>

                                        <a class="item-edit "
                                           href="{{route('color.update',$color)}}"
                                           title="ویرایش">
                                        </a>

                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                            {{$colors->render()}}

                        @else
                            <div class="alert-warning alert">
                                در حال خواندن اطلاعات از دیتابیس ...
                            </div>
                        @endif

                    </table>
                </div>
            </div>

            <div class="col-4 bg-white">
                <p class="box__title">ایجاد رنگ جدید</p>

                <form wire:submit.prevent="categoryForm" enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')

                    <div class="form-group">
                        <input type="text" placeholder="نام رنگ " class="form-control"
                               wire:model.lazy="color.name">
                    </div>

                    <div class="form-group">
                        <input type="text" placeholder="کد رنگ " class="form-control"
                               wire:model.lazy="color.color">
                    </div>


                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" name="status" class="form-control"
                                   wire:model.lazy="color.status">

                            <label for="option4">
                                نمایش در رنگ ها:
                            </label>
                        </div>
                    </div>

                    <button class="btn btn-brand">افزودن رنگ</button>
                </form>
            </div>
        </div>
    </div>
</div>
