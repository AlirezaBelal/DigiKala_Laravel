@section('title','سطل زباله تنوع قیمت محصولات')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item " href="{{route('product.index')}}">
                    محصولات
                </a>

                <a class="tab__item is-active" href="{{route('productVendor.index')}}">
                    تنوع قیمت محصول
                </a>
                |
                <a class="tab__item">جستجو: </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input wire:model.debounce.1000="search"
                               type="text" class="text" placeholder="جستجوی تنوع قیمت ...">
                    </form>
                </a>

                <a class="tab__item btn btn-danger"
                   href="{{route('productVendor.trashed')}}"
                   style="color: white;float: left;margin-top: 10px;margin-left: 10px">
                    سطل زباله
                    ({{\App\Models\ProductSeller::onlyTrashed()->count()}})
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
                            <th>نام محصول</th>
                            <th>نام فروشنده</th>
                            <th>گارانتی</th>
                            <th>رنگ</th>
                            <th>قیمت</th>
                            <th>قیمت تخفیف خورده</th>
                            <th>زمان ارسال</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            @php($count = 1)
                            <tbody>
                            @foreach($productSellers as $productSeller)
                                <tr role="row">
                                    <td>
                                        {{$count++}}
                                    </td>

                                    <td>
                                        @foreach(\App\Models\Product::where('id',$productSeller->product_id)->get() as $productSellerProduct)
                                            {{$productSellerProduct->title}}
                                        @endforeach
                                    </td>

                                    <td>
                                        @foreach(\App\Models\User::where('id',$productSeller->vendor_id)->get() as $productSellerUser)
                                            {{$productSellerUser->name}}
                                        @endforeach
                                    </td>

                                    <td>
                                        @foreach(\App\Models\Warranty::where('id',$productSeller->warranty_id)->get() as $productSellerWarranty)
                                            {{$productSellerWarranty->name}}
                                        @endforeach
                                    </td>

                                    <td>
                                        @foreach(\App\Models\Color::where('id',$productSeller->color_id)->get() as $productSellerColor)
                                            {{$productSellerColor->name}}
                                        @endforeach
                                    </td>

                                    <td>
                                        {{$productSeller->price}}
                                        تومان
                                    </td>

                                    <td>
                                        {{$productSeller->discount_price}}
                                        تومان
                                    </td>

                                    <td>
                                        {{$productSeller->time}}
                                        روز کاری
                                    </td>

                                    <td>
                                        <a wire:click="deleteCategory({{$productSeller->id}})" type="submit"
                                           class="item-delete mlg-15"
                                           title="حذف">
                                        </a>

                                        <a wire:click="trashedProduct({{$productSeller->id}})"
                                           class="item-li i-checkouts item-restore"
                                           title="بازگردانی">
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                            {{$productSellers->render()}}
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
