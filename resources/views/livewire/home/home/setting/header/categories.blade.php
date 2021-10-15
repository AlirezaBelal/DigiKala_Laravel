<li class="c-navi-new-list__a-hover js-navi-new-list-category-hover">
    <div></div>
</li>

<li class="js-categories-bar-item js-mega-menu-main-item c-navi-new-list__category-container-main">
    @include('livewire.home.home.setting.header.category.category_name')
    <div class="c-navi-new-list__sublist js-mega-menu-categories-options c-navi-new__ads-holder">
        @include('livewire.home.home.setting.header.category.category')
        @include('livewire.home.home.setting.header.category.subcategory')
        @include('livewire.home.home.setting.header.category.banner')
    </div>
</li>
