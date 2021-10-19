<div>
    <main id="main">
        <div id="HomePageTopBanner"></div>
        <div id="content">
            @include('livewire.home.home.home.slider')
            @include('livewire.home.home.home.special-1')
            @include('livewire.home.home.home.ads-1')
{{--            @include('livewire.home.home.home.special-2')--}}
{{--            @include('livewire.home.home.home.index-product')--}}
        </div>
        <div id="sidebar">
            <aside></aside>
        </div>
    </main>
    @include('livewire.home.home.home.modals')

</div>
