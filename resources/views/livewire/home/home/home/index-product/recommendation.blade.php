<div class="o-page__row c-box c-promotion__categories-container c-promotion__categories-container--home">
    <div class="c-promotion__categories-title">بیش از
        {{\App\Models\PersianNumber::translate(\App\Models\Product::count())}}
        کالا در دسته‌بندی‌های مختلف
    </div>
    <div class="c-promotion__categories">
        @foreach(\App\Models\Category::where('status',1)->get() as $category)
            <a href="{{$category->link}}"
               class="c-promotion__category c-promotion__category--{{$category->icon}}">
                <div class="c-promotion__category-name">{{$category->title}}</div>
                <div class="c-promotion__category-quantity">
                    {{\App\Models\PersianNumber::translate(\App\Models\Product::where('category_id',$category->id)->count())}}
                    کالا
                </div>
            </a>
        @endforeach
    </div>
</div>
