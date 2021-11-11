<div>
    @section('title')
        پروفایل -
        {{auth()->user()->name}}
    @endsection
    <main id="main">
        <div id="HomePageTopBanner"></div>
        <div id="content">
            <div class="container c-profile-page">
                <section class="o-page">
                    <div class="o-page__row">
                        @include('livewire.home.profile.index.aside')
                        @include('livewire.home.profile.notification.notification')
                    </div>
                </section>
            </div>
        </div>
    </main>
</div>
