@section('title','سطل زباله برندها')


<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">

                <a class="tab__item " href="{{route('brand.index')}}">
                    برند ها
                </a>

                |
                <a class="tab__item">جستجو: </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input type="text" class="text" placeholder="جستجوی دسته ..."
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
                                        <a class="item-li i-checkouts item-restore"
                                           wire:click="trashedCategory({{$brand->id}})">
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
