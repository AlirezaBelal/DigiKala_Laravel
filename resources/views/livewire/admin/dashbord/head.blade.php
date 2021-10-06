
    <meta charset="UTF-8">
    <meta name="turbolinks-cache-control" content="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>
        دیجی کالا |
        @yield('title')
    </title>

    <link rel="stylesheet" href="{{asset('css/bootstrap.rtl.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/style.css')}}">
    <link rel="stylesheet" href="{{asset('css/responsive_991.css')}}" media="(max-width:991px)">
    <link rel="stylesheet" href="{{asset('css/responsive_768.css')}}" media="(max-width:768px)">
    <link rel="stylesheet" href="{{asset('css/font.css')}}">
    <script src="{{asset('js/ckeditor.js')}}"></script>
    <livewire:styles />

    <style>
        .breadcrumb {
            display: block;
        }
        .form-group
        {
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .dropdown-select
        {
            display: none;
        }
        .item-restore::before {
            content: "\E0e5";
            font-size: 20px;
            top: 10px;
            right: 15px;
            color: #636e72;
        }
    </style>
