<!DOCTYPE html>
<html lang="fa">
<head>
    @include('livewire.home.home.head')
</head>
<body class=" t-index" style="">


@include('sweet::alert')
@include('livewire.home.home.header')
{{$slot}}

@include('livewire.home.home.footer')
</body>

@include('livewire.home.home.jscript')

</html>
