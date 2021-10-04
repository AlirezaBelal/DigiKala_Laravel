<!DOCTYPE html>
<html lang="fa">
<head>
    <livewire:admin.dashboard.head/>
    <script src="{{mix('/js/app.js')}}"></script>
</head>
<body>
<livewire:admin.dashboard.sidebar/>
<div class="content">
    <livewire:admin.dashboard.header/>
    @include('livewire.admin.dashboard.breadcrumb')
    {{$slot}}
</div>
</body>
<livewire:admin.dashboard.footer/>

<script src="{{asset('/js/livewire-turbolinks.js')}}" data-turbolinks-eval="false" data-turbo-eval="false"></script>
</html>
