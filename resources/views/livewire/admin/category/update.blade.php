@section('title' , 'ویرایش دسته')

<div>
    <div class="main-content padding-0">
        <p class="box__title">
            ویرایش دسته
            -
            {{$category->title}}
        </p>
        <div class="row no-gutters bg-white">
            <div class="col-6">
                <form wire:submit.prevent="categoryForm" class="padding-15"
                      enctype="multipart/form-data" role="form">


                    @include('errors.error')
                    <div class="form-group">
                        <input type="text" wire:model.lazy="category.title" placeholder="نام دسته" class="form-control">
                    </div>

                    <div class="form-group">
                        <input type="text" wire:model.lazy="category.name" placeholder="نام انگلیسی دسته"
                               class="form-control">
                    </div>

                    <div class="form-group">
                        <input type="text" wire:model.lazy="category.link" placeholder="لینک دسته" class="form-control">
                    </div>

                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" wire:model.lazy="category.status" name="status"
                                   class="form-control">
                            <label for="option4">نمایش در دسته اصلی:</label>
                        </div>

                    </div>

                    <div class="form-group">
                        <input type="file" wire:model.lazy="img" class="form-control">
                        <span class="m-2 text-danger" wire:loading wire:target="img">
                            در حال آپلود ...
                        </span>
                        <div wire:ignore class="progress mt-3" id="progressbar" style="display: none">
                            <div class="progress-bar" role="progressbar" style="width: 0%;">0%</div>
                        </div>
                    </div>

                    <div>
                        @if($img)
                            <img class="form-control mt-3" width="250px" src="{{$img->temporaryUrl()}}" alt="" style="width:200px">
                        @endif
                    </div>

                    <button class="btn btn-brand mt-3">ویرایش دسته</button>
                </form>
            </div>
            <div class="col-6>

            </div>
        </div>
    </div>
</div>
