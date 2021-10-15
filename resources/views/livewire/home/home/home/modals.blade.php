<div class="remodal c-remodal-account" data-remodal-id="login" role="dialog" aria-labelledby="modal1Title"
     aria-describedby="modal1Desc">
    <button data-remodal-action="close" class="remodal-close" aria-label="Close"></button>
    <div class="c-remodal-account__headline">ورود به دیجی‌کالا</div>
    <div class="c-remodal-account__content">
        <form class="c-form-account" id="loginFormModal">
            <div class="c-message-light c-message-light--info" id="login-form-msg"></div>
            <div class="c-form-account__title">پست الکترونیک یا شماره موبایل</div>
            <div class="c-form-account__row">
                <div class="c-form-account__col"><label class="c-ui-input c-ui-input--account-login"><input
                            class="c-ui-input__field" type="text" name="login[email_phone]"
                            autocomplete="current-email" placeholder="info@digikala.com"></label></div>
            </div>
            <div class="c-form-account__title">کلمه عبور</div>
            <div class="c-form-account__row">
                <div class="c-form-account__col"><label class="c-ui-input c-ui-input--account-password"><input
                            class="c-ui-input__field" name="login[password]" type="password"
                            autocomplete="current-password" placeholder=""></label></div>
            </div>
            <div class="c-form-account__agree"><label class="c-ui-checkbox c-ui-checkbox--primary"><input
                        type="checkbox" value="1" name="login[remember]" id="accountAutoLogin"><span
                        class="c-ui-checkbox__check"></span></label><label for="accountAutoLogin">مرا به خاطر داشته
                    باش</label></div>
            <div class="c-form-account__row c-form-account__row--submit">
                <div class="c-form-account__col">
                    <button class="btn-login login-button-js">ورود به دیجی‌کالا</button>
                </div>
            </div>
            <div class="c-form-account__link"><a data-snt-event="dkLoginClick"
                                                 data-snt-params='{"type":"forgetPassword","site":"login-modal"}'
                                                 href="users/password/forgot/index.html" class="btn-link-spoiler">رمز
                    عبور خود را فراموش کرده ام</a></div>
            <div class="c-message-light c-message-light--error has-oneline" id="loginFormError">نام کاربری
                یا کلمه عبور اشتباه است.
            </div>
        </form>
    </div>
    <div class="c-remodal-account__footer is-highlighted"><span>کاربر جدید هستید؟</span><a
            data-snt-event="dkLoginClick"
            data-snt-params='{"type":"signup","site":"login-modal"}'
            href="users/login-register/index0f4c.html?_back=https://www.digikala.com/"
            class="btn-link-spoiler">ثبت‌نام
            در دیجی‌کالا</a></div>
</div>
<div class="remodal c-remodal-loader" data-remodal-id="loader"
     data-remodal-options="hashTracking: false, closeOnOutsideClick: false" role="dialog"
     aria-labelledby="modal1Title"
     aria-describedby="modal1Desc">
    <div class="c-remodal-loader__icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="115" height="30" viewBox="0 0 115 30">
            <path fill="#EE384E" fill-rule="evenodd"
                  d="M76.916 19.024h6.72v-8.78h-6.72c-1.16 0-2.24 1.061-2.24 2.195v4.39c0 1.134 1.08 2.195 2.24 2.195zm26.883 0h6.72v-8.78h-6.72c-1.16 0-2.24 1.061-2.24 2.195v4.39c0 1.134 1.08 2.195 2.24 2.195zM88.117 6.951v15.366c0 .484-.625 1.098-1.12 1.098l-2.24.023c-.496 0-1.12-.637-1.12-1.12v-.733l-1.017 1.196c-.31.413-1.074.634-1.597.634h-4.107c-3.604 0-6.721-3.063-6.721-6.586v-4.39c0-3.523 3.117-6.585 6.72-6.585h10.082c.495 0 1.12.613 1.12 1.097zm26.883 0v15.366c0 .484-.624 1.098-1.12 1.098l-2.24.023c-.496 0-1.12-.637-1.12-1.12v-.733l-1.017 1.196c-.31.413-1.074.634-1.597.634h-4.107c-3.604 0-6.721-3.063-6.721-6.586v-4.39c0-3.523 3.117-6.585 6.72-6.585h10.082c.495 0 1.12.613 1.12 1.097zm-74.675 3.293h-6.721c-1.16 0-2.24 1.061-2.24 2.195v4.39c0 1.134 1.08 2.195 2.24 2.195h6.72v-8.78zm4.48-3.293V23.78c0 3.523-3.117 6.22-6.72 6.22H34.62c-.515 0-1-.236-1.311-.638l-1.972-2.55c-.327-.424-.144-1.202.399-1.202h6.347c1.16 0 2.24-.696 2.24-1.83v-.365h-6.72c-3.604 0-6.72-3.063-6.72-6.586v-4.39c0-3.523 3.116-6.585 6.72-6.585h4.107c.514 0 1.074.405 1.437.731l1.177 1.098V6.95c0-.483.625-1.097 1.12-1.097h2.24c.496 0 1.12.613 1.12 1.097zM4.481 16.83c0 1.134 1.08 2.195 2.24 2.195h6.72v-8.78h-6.72c-1.16 0-2.24 1.061-2.24 2.195v4.39zM16.8 0c.497 0 1.121.613 1.121 1.098v21.22c0 .483-.624 1.097-1.12 1.097h-2.24c-.496 0-1.12-.613-1.12-1.098v-.732l-1.175 1.232c-.318.346-.932.598-1.44.598H6.722C3.117 23.415 0 20.352 0 16.829v-4.356c0-3.523 3.117-6.62 6.72-6.62h6.722V1.099c0-.485.624-1.098 1.12-1.098h2.24zm46.3 14.634L69.336 6.9c.347-.421.04-1.048-.513-1.048h-3.566c-.27 0-.525.119-.696.323l-6.314 7.727V1.098c0-.485-.625-1.098-1.12-1.098h-2.24c-.496 0-1.12.613-1.12 1.098v21.22c0 .483.624 1.097 1.12 1.097h2.24c.495 0 1.12-.614 1.12-1.098v-6.951l6.317 7.744c.17.207.428.328.7.328h3.562c.554 0 .86-.627.514-1.048l-6.24-7.756zM48.166 0c-.496 0-1.12.613-1.12 1.098v2.195c0 .484.624 1.097 1.12 1.097h2.24c.495 0 1.12-.613 1.12-1.097V1.098c0-.485-.625-1.098-1.12-1.098h-2.24zm0 5.854c-.496 0-1.12.613-1.12 1.097v15.366c0 .484.8 1.12 1.295 1.12l2.065-.022c.495 0 1.12-.614 1.12-1.098V6.951c0-.484-.625-1.097-1.12-1.097h-2.24zM21.282 0c-.495 0-1.12.613-1.12 1.098v2.195c0 .484.625 1.097 1.12 1.097h2.24c.496 0 1.12-.613 1.12-1.097V1.098c0-.485-.624-1.098-1.12-1.098h-2.24zm0 5.854c-.495 0-1.12.613-1.12 1.097v15.366c0 .484.625 1.098 1.12 1.098h2.24c.496 0 1.12-.614 1.12-1.098V6.951c0-.484-.624-1.097-1.12-1.097h-2.24zm73.556-4.756v21.22c0 .483-.625 1.097-1.12 1.097h-2.24c-.496 0-1.12-.614-1.12-1.098V1.097c0-.484.624-1.097 1.12-1.097h2.24c.495 0 1.12.613 1.12 1.098z"/>
        </svg>
    </div>
    <div class="c-remodal-loader__bullets"><i class="c-remodal-loader__bullet c-remodal-loader__bullet--1"></i><i
            class="c-remodal-loader__bullet c-remodal-loader__bullet--2"></i><i
            class="c-remodal-loader__bullet c-remodal-loader__bullet--3"></i><i
            class="c-remodal-loader__bullet c-remodal-loader__bullet--4"></i></div>
</div>
<div class="remodal c-remodal-general-alert" data-remodal-id="alert" role="dialog" aria-labelledby="modal1Title"
     aria-describedby="modal1Desc">
    <div class="c-remodal-general-alert__main">
        <div class="c-remodal-general-alert__content"><p class="js-remodal-general-alert__text"></p>
            <p class="c-remodal-general-alert__description js-remodal-general-alert__description"></p></div>
        <div class="c-remodal-general-alert__actions">
            <button
                class="c-remodal-general-alert__button c-remodal-general-alert__button--approve js-remodal-general-alert__button--approve"></button>
            <button
                class="c-remodal-general-alert__button c-remodal-general-alert__button--cancel js-remodal-general-alert__button--cancel"></button>
        </div>
    </div>
</div>
<div class="remodal c-remodal-general-information" data-remodal-id="information" role="dialog"
     aria-labelledby="modal1Title"
     aria-describedby="modal1Desc">
    <div class="c-remodal-general-information__main">
        <div class="c-remodal-general-information__content"><p class="js-remodal-general-information__text"></p>
        </div>
        <div class="c-remodal-general-information__actions">
            <button
                class="c-remodal-general-information__button c-remodal-general-information__button--approve js-remodal-general-information__button--approve"></button>
        </div>
    </div>
</div>
<div class="remodal c-remodal c-remodal-quick-view" data-remodal-id="quick-view" role="dialog"
     aria-labelledby="modal1Title"
     aria-describedby="modal1Desc">
    <button data-remodal-action="close" class="remodal-close c-remodal__close" aria-label="Close"></button>
    <div class="c-quick-view__content js-quick-view-section"></div>
</div>
<div class="remodal c-remodal-fmcg" data-remodal-id="fmcg-modal"
     data-remodal-options="hashTracking: false, closeOnOutsideClick: false" role="dialog">
    <button data-remodal-action="close" class="remodal-close" aria-label="Close"></button>
    <div class="c-remodal-fmcg__container"><img src="static/files/cbaed462.png" class="c-remodal-fmcg__logo"/>
        <div class="c-remodal-fmcg__content"><p class="c-remodal-fmcg__head-text">ارسال سریع کالای
                <span> سوپر مارکتی </span> فقط در تهران و کرج امکان پذیر است.</p>
            <p class="c-remodal-fmcg__question">با توجه به محدودیت ارسال، آیا مایل هستید این کالا به سبد خرید شما
                افزوده
                شود؟</p>
            <div class="c-remodal-fmcg__actions">
                <button class="c-remodal-fmcg__button c-remodal-fmcg__button--reject js-fmcg-modal-reject">خیر
                </button>
                <button class="c-remodal-fmcg__button c-remodal-fmcg__button--approve js-fmcg-modal-approve">بله
                </button>
            </div>
        </div>
    </div>
</div>
<div class="c-toast__container js-toast-container">
    <div class="c-toast js-toast" style="display: none">
        <div class="c-toast__text js-toast-text"></div>
        <div class="c-toast__btn-container">
            <button type="button" class="js-toast-btn o-link o-link--sm o-link--no-border o-btn">
                متوجه شدم
            </button>
        </div>
    </div>
</div>
<div class="remodal c-remodal-location js-general-location" data-remodal-id="general-location" role="dialog"
     aria-labelledby="modal1Title"
     aria-describedby="modal1Desc">
    <div class="c-remodal-location__header"><span class="js-general-location-title">انتخاب استان</span>
        <div class="c-remodal-location__close js-close-modal"></div>
    </div>
    <div class="c-remodal-location__content js-states-container">
        <div class="c-general-location__row c-general-location__row--your-location js-your-location">
            مکان‌یابی خودکار
        </div>
    </div>
    <div class="c-remodal-location__content js-cities-container">
        <div class="c-general-location__row c-general-location__row--back js-back-to-states">
            بازگشت به لیست استان‌ها
        </div>
    </div>
</div>
<div class="remodal c-remodal-location c-remodal-location--addresses js-general-location-addresses"
     data-remodal-id="general-location" role="dialog" aria-labelledby="modal1Title"
     aria-describedby="modal1Desc">
    <div class="c-remodal-location__header"><span class="js-general-location-title">انتخاب آدرس</span>
        <div class="c-remodal-location__close js-close-modal"></div>
    </div>
    <div class="c-remodal-location__content js-addresses-container">
        <div class="c-ui-radio-wrapper c-ui-radio--general-location js-sample-address u-hidden"><label
                class="c-filter__label " for="generalLocationAddress"></label><label class="c-ui-radio"><input
                    type="radio" value="" name="generalLocationAddress" class=""
                    id="generalLocationAddress" data-title=""><span class="c-ui-radio__check"></span></label></div>
        <a href="addresses/add/index.html" class="c-general-location__add-address js-general-location-add-address">
            افزودن آدرس جدید
        </a></div>
</div>
