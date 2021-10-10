@section('title','سطل زباله برند ها')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item" href="{{route('brand.index')}}">
                    برند ها
                </a>
                |
                <a class="tab__item">جستجو: </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input wire:model.debounce.1000="search"
                               type="text" class="text" placeholder="جستجوی برند ...">
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
            <div class="col-12 margin-left-10 margin-bottom-15 border-radius-3">
                <div class="table__box">
                    <table class="table">
                        <thead role="rowgroup">
                        <tr role="row" class="title-row">
                            <th>ردیف</th>
                            <th>تصویر برند</th>
                            <th>نام برند</th>
                            <th>دسته برند</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            @php($count = 1)
                            <tbody>
                            @foreach($brands as $brand)
                                <tr role="row">
                                    <td>
                                        {{$count++}}
                                    </td>

                                    <td>
                                        <img src="{{\Illuminate\Support\Facades\Storage::url($brand->img)}}" alt="img"
                                             width="50px">
                                    </td>

                                    <td>
                                        {{$brand->name}}
                                    </td>

                                    <td>
                                        @foreach(\App\Models\Category::where('id',$brand->parent)->get() as $category)
                                            {{$category->title}}
                                        @endforeach
                                    </td>

                                    <td>
                                        <a wire:click="deleteCategory({{$brand->id}})" type="submit"
                                           class="item-delete mlg-15"
                                           title="حذف">
                                        </a>
                                        <a wire:click="trashedCategory({{$brand->id}})"
                                           class="item-li i-checkouts item-restore"
                                           title="ّبازگردانی">
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
        </div>
    </div>
</div>
