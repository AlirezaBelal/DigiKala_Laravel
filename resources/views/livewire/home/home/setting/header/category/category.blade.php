<div class="c-navi-new-list__inner-categories">
    @foreach(\App\Models\Category::where('status',1)->get() as $category)
        <a
            href="{{$category->link}}"
            class="c-navi-new-list__inner-category c-navi-new-list__inner-category--hovered
                                         js-mega-menu-category c-navi-new-list__inner-category--{{$category->icon}}"
            data-index="{{$category->id}}">{{$category->title}}</a>
    @endforeach
</div>
