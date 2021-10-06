@section('title','گزارشات سیستم')

<div>
    <div class="main-content" wire:init="loadCategory">
        <div class="tab__box">
            <div class="tab__items">

                <a class="tab__item is-active" href="{{route('log.index')}}">
                    گزارشات سیستم
                </a>
                |
                <a class="tab__item">جستجو: </a>

                <a class="t-header-search">
                    <form action="" onclick="event.preventDefault();">
                        <input type="text" class="text" placeholder="جستجوی دسته ..."
                               wire:model.debounce.1000="search">
                    </form>
                </a>
            </div>
        </div>

        <div class="row">
            <div class="col-12 margin-left-10 margin-bottom-15 border-radius-3">
                <div class="table__box">
                    <table class="table">

                        <thead role="rowgroup">
                        <tr role="row" class="title-row">
                            <th>ردیف</th>
                            <th>کاربر</th>
                            <th>لینک</th>
                            <th>وضعیت</th>
                        </tr>
                        </thead>

                        @if($readyToLoad)
                            <tbody>
                            @php($count = 1)
                            @foreach($logs as $log)
                                <tr role="row">
                                    <td>
                                        {{$count++}}
                                    </td>
                                    <td>
                                        @foreach(\App\Models\User::where('id',$log->user_id)->get() as $user)
                                            {{$user->name}}
                                        @endforeach
                                    </td>

                                    <td>
                                        {{$log->url}}
                                    </td>

                                    <td>

                                        @if($log->actionType =='ایجاد')
                                            <span style="background-color: green"
                                                  class="badge badge-success">ایجاد</span>
                                        @elseif($log->actionType =='حذف')
                                            <span style="background-color: red" class="badge badge-danger ">حذف</span>
                                        @elseif($log->actionType =='آپدیت')
                                            <span style="background-color: #e29c5f"
                                                  class="badge badge-warning">آپدیت</span>
                                        @elseif($log->actionType =='فعال')
                                            <span style="background-color:blue" class="badge badge-primary">فعال</span>
                                        @elseif($log->actionType =='غیرفعال')
                                            <span style="background-color:red" class="badge badge-danger">غیرفعال</span>
                                        @elseif($log->actionType =='بازیابی')
                                            <span style="background-color:wheat"
                                                  class="badge badge-warning">بازیابی</span>
                                        @endif

                                    </td>
                                </tr>

                            @endforeach
                            </tbody>
                            {!! $logs->render() !!}
                        @else
                            <div class="alert-warning alert">
                                در حال خواندن اطلاعات از دیتابیس ...
                            </div>
                        @endif

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>