<script>
    function modallist() {
        document.getElementById("list").style = "display: block !important; ";
        document.getElementById("list").classList.remove("remodal-is-closed");
        document.getElementById("list").classList.add("remodal-is-opened");
        document.getElementById("list2").classList.remove("remodal-is-closed");
        document.getElementById("list2").classList.add("remodal-is-opened");
    }

    function closemodallist() {
        document.getElementById("list").style = "display: none !important; ";
        document.getElementById("list").classList.remove("remodal-is-opened");
        document.getElementById("list").classList.add("remodal-is-closed");
    }

    function share(id) {
        var $id = id;
        document.getElementById("share").style = "display: block !important; ";
        document.getElementById("share").classList.remove("remodal-is-closed");
        document.getElementById("share").classList.add("remodal-is-opened");
        document.getElementById("share2").classList.remove("remodal-is-closed");
        document.getElementById("share2").classList.add("remodal-is-opened");
        var twitter = "https://twitter.com/intent/tweet?url=https://www.digikala.com/wishlist/";
        var whatsapp = "https://wa.me?text=https://www.digikala.com/wishlist/";
        var linksite = window.location.origin;
        document.getElementById("linktwitter").href = twitter + id;
        document.getElementById("whatsapp").href = whatsapp + id;
        document.getElementById("inputselect").value = linksite + "/wishlist/" + id;

    }

    function copylink() {
        var copy = document.getElementById("inputselect");
        copy.select();
        navigator.clipboard.writeText(copy.value);
        document.getElementById("copied").style = "display: none !important; ";
        document.getElementById("copied2").classList.remove("u-hidden");
        setTimeout(function (){
            if (document.getElementById("copied2")){
                document.getElementById("copied").style = "display: block !important; ";
                document.getElementById("copied2").classList.add("u-hidden");
            }
        },3000)
    }

    function closemodalshare() {
        document.getElementById("share").style = "display: none !important; ";
        document.getElementById("share").classList.remove("remodal-is-opened");
        document.getElementById("share").classList.add("remodal-is-closed");
    }
</script>
<div id="list" class="remodal-wrapper remodal-is-closed" style="display: none;">
    <div id="list2"
         class="remodal2 c-public-fav-list__modal js-add-public-list-modal remodal-is-initialized remodal-is-closed"
         data-remodal-id="add-public-list-modal" role="dialog" tabindex="-1">
        <form wire:submit.prevent="favlistForm">
            <div class="c-public-fav-list__modal-header">
                <div class="c-public-fav-list__modal-header--title">?????????? ????????</div>
                <div onclick="closemodallist()" data-remodal-action="close"
                     class="c-public-fav-list__modal-header--close" aria-label="Close"></div>
            </div>
            <div class="c-public-fav-list__modal-content-new"><label> ?????????? ???????? <label
                        style="color: red">*</label></label>
                <input wire:model.defer="favList.title"
                       class="js-public-list-title">
                <span
                    class="js-public-list-error-message u-hidden">?????????? ???????? ???????? ?????????? ???? ?? ?????? ?????????? ????????.</span><label
                    class="u-mt-16">??????????????</label>
                <textarea wire:model.defer="favList.description"
                          class="js-public-list-description"></textarea><span
                    class="js-public-list-description-error-message u-hidden">?????????????? ???????? ???????? ???????? ???? ?????? ?????? ?????????? ????????.</span>
            </div>
            <div class="c-public-fav-list__modal-footer c-public-fav-list__modal-footer--left">
                <button onclick="closemodallist()" aria-label="Close" data-remodal-action="close"
                        class="o-btn o-btn--outlined-gray-md u-ml-12">
                    ????????????
                </button>
                <button type="submit" class="o-btn o-btn--contained-red-md js-submit-public-list">????????????</button>

            </div>
        </form>
    </div>
</div>
<div id="share" class="remodal-wrapper remodal-is-opened" style="display: none;">
    <div id="share2" class="remodal2 c-modal c-modal--sm remodal-is-initialized remodal-is-opened"
         data-remodal-id="share"
         style="max-width: 402px !important;" role="dialog" aria-labelledby="modalTitle" tabindex="-1"
         aria-describedby="modalDesc" data-remodal-options="">
        <div class="c-modal__top-bar  c-modal__top-bar--has-line">
            <div class="c-modal__title ">?????????????????????????</div>
            <div onclick="closemodalshare()" class="c-modal__close" data-remodal-action="close"></div>
        </div>
        <form class="c-share" id="share-public-list-modal">
            <div class="c-share__title">
                ???? ?????????????? ???? ??????????????? ?????? ??????????????????? ?????? ???????? ???? ???? ???????????? ?????? ???? ???????????? ??????????????.
            </div>
            <div class="c-share__options">
                <div class="c-share__social-buttons">
                    <a id="linktwitter"
                       href="https://twitter.com/intent/tweet?url=https://www.digikala.com/wishlist/{{$favlist->link ?? '' }}/"
                       rel="nofollow" class="js-twitter o-btn c-share__social c-share__social--twitter"
                       target="_blank"></a>
                    <a id="whatsapp"
                       href="https://wa.me?text=https://www.digikala.com/wishlist/{{$favlist->link ?? '' }}/"
                       rel="nofollow"
                       class="js-whatsapp o-btn c-share__social c-share__social--whatsapp"
                       target="_blank"></a><a href="" rel="nofollow"
                                              class="js-facebook o-btn c-share__social c-share__social--fb u-hidden"
                                              target="_blank"></a></div>
                <div class="js-share-value o-btn o-btn--outlined-gray-sm o-btn--copy c-share__link-btn js-copy-url"
                     onclick="copylink()"
                     id="copied"
                     data-copy="">
                    <input type="hidden" value="" id="inputselect">
                    ?????? ????????
                </div>
                <div id="copied2"
                     class="u-hidden js-share-value o-btn o-btn--outlined-gray-sm o-btn--copy c-share__link-btn js-copy-url copied"
                     data-copy="">?????? ????
                </div>
            </div>
        </form>
    </div>
</div>


