@section('title','سطل زباله مشخصات کالا ')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">
                <a class="tab__item " href="{{route('attribute.index')}}">
                    مشخصات کالا ها
                </a>

                <a class="tab__item " href="{{route('attributeValue.index')}}">
                    مقدار مشخصات کالا
                </a>

                <a class="tab__item btn btn-danger"
                   href="{{route('attribute.trashed')}}"
                   style="color: white;float: left;margin-top: 10px;margin-left: 10px">
                    سطل زباله
                    ({{\App\Models\Attribute::onlyTrashed()->count()}})
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
                            <th>عنوان</th>
                            <th>دسته نمایش کالا</th>
                            <th>زیر دسته مشخصات</th>
                            <th>موقعیت</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            @php($count = 1)
                            <tbody>
                            @foreach($attributes as $attribute)
                                <tr role="row">
                                    <td>
                                        {{$count++}}
                                    </td>

                                    <td>
                                        {{$attribute->title}}
                                    </td>

                                    <td>
                                        @foreach(\App\Models\ChildCategory::where('id',$attribute->childCategory)->get() as $attributeChildCategory)
                                            {{$attributeChildCategory->title}}
                                        @endforeach
                                    </td>

                                    <td>
                                        @if($attribute->parent == 0)
                                            سر دسته مشخصات
                                        @else
                                            @foreach(\App\Models\Attribute::where('id',$attribute->parent)->get() as $attributeParent)
                                                {{$attributeParent->title}}
                                            @endforeach
                                        @endif
                                    </td>

                                    <td>
                                        {{$attribute->position}}
                                    </td>

                                    <td>
                                        <a wire:click="deleteCategory({{$attribute->id}})" type="submit"
                                           class="item-delete mlg-15"
                                           title="حذف">
                                        </a>
                                        <a wire:click="trashedCategory({{$attribute->id}})"
                                           class="item-li i-checkouts item-restore"
                                           title="بازگردانی">
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                            {{$attributes->render()}}
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
