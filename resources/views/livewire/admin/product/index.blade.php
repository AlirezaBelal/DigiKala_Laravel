@section('title','محصولات')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item is-active" href="{{route('product.index')}}">
                    محصولات
                </a>
                |
                <a class="tab__item">
                    جستجو:
                </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input wire:model.debounce.1000="search"
                               type="text" class="text" placeholder="جستجوی محصول ...">
                    </form>
                </a>


                <a class="tab__item btn btn-danger" style="color: white;float: left;margin-top: 10px;margin-left: 10px"
                   href="">
                    سطل زباله
                    ({{\App\Models\Product::onlyTrashed()->count()}})
                </a>

                <a class="tab__item btn btn-success" style="color: white;float: left;margin-top: 10px;margin-left: 10px"
                   href="{{route('product.create')}}">
                    افزودن محصول
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
                            <th>تصویر محصول</th>
                            <th>عنوان محصول</th>
                            <th>فروشنده محصول</th>
                            <th>دسته های محصول</th>
                            <th>برند محصول</th>
                            <th>قیمت محصول</th>
                            <th>وضعیت محصول</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            <tbody>
                            @php($count = 1)
                            @foreach($products as $product)
                                <tr role="row">
                                    <td>
                                        {{$count++}}
                                    </td>
                                    <td>
                                        <img src="{{\Illuminate\Support\Facades\Storage::url($product->img)}}" alt="img"
                                             width="50px">
                                    </td>
                                    <td>
                                        {{$product->title}}
                                    </td>
                                    <td>
                                        @foreach(\App\Models\User::where('id',$product->vendor_id)->get() as $user)
                                            {{$user->name}}
                                        @endforeach
                                    </td>
                                    <td>
                                        @foreach(\App\Models\Category::where('id',$product->category_id)->get() as $cat)
                                            {{$cat->title}}
                                        @endforeach
                                        <br>
                                        -
                                        @foreach(\App\Models\SubCategory::where('id',$product->subcategory_id)->get() as $cat)
                                            {{$cat->title}}
                                        @endforeach

                                        <br>
                                        --
                                        @foreach(\App\Models\ChildCategory::where('id',$product->childcategory_id)->get() as $cat)
                                            {{$cat->title}}
                                        @endforeach

                                    </td>
                                    <td>
                                        {{$product->brand_id}}
                                    </td>
                                    <td>
                                        قیمت:
                                        {{number_format($product->price)}}
                                        تومان
                                        <br>
                                        با تخفیف
                                        {{number_format($product->discount_price)}}
                                        تومان
                                    </td>

                                    <td>
                                        @if($product->status_product == 1)
                                            <button type="submit" class="badge-success badge"
                                                    style="background-color: green"
                                                    wire:click="updateCategoryDisable({{$product->id}})">
                                                فعال
                                            </button>
                                        @else
                                            <button type="submit" class="badge-danger badge"
                                                    style="background-color: red"
                                                    wire:click="updateCategoryEnable({{$product->id}})">
                                                غیرفعال
                                            </button>
                                        @endif
                                    </td>
                                    <td>
                                        <a type="submit" class="item-delete mlg-15"
                                           wire:click="deleteCategory({{$product->id}})"
                                           title="حذف">
                                        </a>

                                        <a href="" class="item-edit " title="ویرایش"></a>
                                    </td>
                                </tr>
                            @endforeach

                            </tbody>
                            {{$products->render()}}
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
