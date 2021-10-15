<div class="sidebar__nav border-top border-left  ">
    <span class="bars d-none padding-0-18"></span>
    <a class="header__logo  d-none" href=""></a>
    <div class="profile__info border cursor-pointer text-center">
        <div class="avatar__img">

            @if(auth()->user()->img)
                <img src="{{asset(auth()->user()->img)}}" class="avatar___img">
            @else
                <img src="{{asset('img/pro.jpg')}}" class="avatar___img">
            @endif

            <input type="file" accept="image/*" class="hidden avatar-img__input">
            <div class="v-dialog__container" style="display: block;"></div>
            <div class="box__camera default__avatar"></div>
        </div>

        <span class="profile__name">
            کاربر :
            {{auth()->user()->name}}
        </span>
    </div>

    <ul>

        <li class="item-li i-dashboard {{Request::routeIs('admin.index') ? 'is-active': '' }} ">
            <a href="{{route('admin.index')}}">
                پیشخوان
            </a>
        </li>

        <li class="item-li i-categories {{Request::routeIs('category.index') ? 'is-active': '' }}">
            <a href="{{route('category.index')}}">
                دسته بندی ها
            </a>
        </li>

        <li class="item-li i-banners {{Request::routeIs('product.index') ? 'is-active': '' }}">
            <a href="{{route('product.index')}}">
                محصولات
            </a>
        </li>

        <li class="item-li i-my__purchases {{Request::routeIs('brand.index') ? 'is-active': '' }}">
            <a href="{{route('brand.index')}}">
                برند محصولات
            </a>
        </li>

        <li class="item-li i-transactions {{Request::routeIs('color.index') ? 'is-active': '' }}">
            <a href="{{route('color.index')}}">
                رنگ محصولات
            </a>
        </li>

        <li class="item-li i-articles {{Request::routeIs('gallery.index') ? 'is-active': '' }}">
            <a href="{{route('gallery.index')}}">
                گالری تصاویر محصولات
            </a>
        </li>

        <li class="item-li i-checkouts {{Request::routeIs('warranty.index') ? 'is-active': '' }}">
            <a href="{{route('warranty.index')}}">
                گارانتی محصولات
            </a>
        </li>

        <li class="item-li i-courses {{Request::routeIs('productVendor.index') ? 'is-active': '' }}">
            <a href="{{route('productVendor.index')}}">
                تنوع قیمت محصولات
            </a>
        </li>

        <li class="item-li i-user__inforamtion {{Request::routeIs('attribute.index') ? 'is-active': '' }}">
            <a href="{{route('attribute.index')}}">
                مشخصات محصولات
            </a>
        </li>

        <hr style="margin-left: 15px;margin-right: 25px">

        <li class="item-li i-slideshow {{Request::routeIs('page.index') ? 'is-active': '' }}">
            <a href="{{route('page.index')}}">
                صفحات سایت
            </a>
        </li>

        <li class="item-li i-notification__management {{Request::routeIs('newsletter.index') ? 'is-active': '' }}">
            <a href="{{route('newsletter.index')}}">
                خبرنامه
            </a>
        </li>

        <li class="item-li i-ads {{Request::routeIs('social.index') ? 'is-active': '' }}">
            <a href="{{route('social.index')}}">
                شبکه های اجتماعی
            </a>
        </li>

        <hr style="margin-left: 15px;margin-right: 25px">

        <li class="item-li i-slideshow {{Request::routeIs('footer.index') ? 'is-active': '' }}">
            <a href="{{route('footer.index')}}">
                تنظیمات فوتر سایت
            </a>
        </li>

        <li class="item-li i-courses {{Request::routeIs('header.index') ? 'is-active': '' }}">
            <a href="{{route('header.index')}}">
                تنظیمات سایت
            </a>
        </li>

        <li class="item-li i-articles {{Request::routeIs('log.index') ? 'is-active': '' }}">
            <a href="{{route('log.index')}}">
                گزارشات سیستم
            </a>
        </li>
    </ul>
</div>
