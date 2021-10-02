<!DOCTYPE html>
<html lang="en">
<head>
    <livewire:admin.dashbord.head/>
</head>
<body>
<livewire:admin.dashbord.sidebar/>
<div class="content">
    <livewire:admin.dashbord.header/>
@include('livewire.admin.dashbord.breadcrumb')
{{$slot}}
</div>
</body>
<livewire:admin.dashbord.footer/>
</html>
