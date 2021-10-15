<div class="c-footer__jumpup">
            <span id="js-jump-to-top" class="c-footer__jumpup-container"><span
                    data-snt-event="dkFooterClick"
                    data-snt-params='{"item":"jump-to-top","item_option":null}'
                    class="c-footer__jumpup-angle"></span>
                    برگشت به بالا
                </span>
</div>
<nav class="c-footer__feature-innerbox">
    @foreach(\App\Models\FooterInnerBox::where('top',1)->get() as $pages)

        @foreach(\App\Models\Page::where('id',$pages->page_id)->get() as $page)

            <a href="{{url($page->link)}}"
               target="_blank">
                <div class="c-footer__feature-item c-footer__feature-item--1"
                     style="background: url(/storage/{{$page->img}}) 43% 8px no-repeat;
                         background-size: auto 58px;">{{$page->title}}</div>
            </a>
        @endforeach
    @endforeach

</nav>
<hr/>
