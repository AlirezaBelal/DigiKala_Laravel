@section('title','آپدیت رنگ')

<div>
    <div class="main-content padding-0">
        <p class="box__title">
            ویرایش رنگ
            -
            {{$colors->name}}
        </p>

        <div class="row no-gutters bg-white">
            <div class="col-8">
                <form wire:submit.prevent="categoryForm"
                      enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')

                    <div class="form-group">
                        <input type="text" placeholder="نام رنگ " class="form-control"
                               wire:model.lazy="color.name">
                    </div>

                    <div class="form-group">
                        <input type="text" placeholder="کد رنگ " class="form-control"
                               wire:model.lazy="color.color">
                    </div>

                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" name="status" class="form-control"
                                   wire:model.lazy="color.status">

                            <label for="option4">
                                نمایش در رنگ اصلی:
                            </label>

                        </div>

                    <button type="submit" class="btn btn-brand">آپدیت رنگ</button>
                </form>
            </div>
        </div>
    </div>
</div>
