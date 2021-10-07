@section('title','آپدیت برند')

<div>
    <div class="main-content padding-0">
        <p class="box__title">
            ویرایش برند
            -
            {{$brands->name}}
        </p>

        <div class="row no-gutters bg-white">
            <div class="col-8">
                <form wire:submit.prevent="categoryForm"
                      enctype="multipart/form-data" role="form"
                      class="padding-10 categoryForm">

                    @include('errors.error')

                    <div class="form-group">
                        <input type="text" placeholder="نام برند " class="form-control"
                               wire:model.lazy="brand.name">
                    </div>

                    <div class="form-group">
                        <input type="text" placeholder="لینک برند " class="form-control"
                               wire:model.lazy="brand.link">
                    </div>

                    <div class="form-group">
                        <div class="notificationGroup">
                            <input id="option4" type="checkbox" name="status" class="form-control"
                                   wire:model.lazy="brand.status">

                            <label for="option4">
                                نمایش در برند اصلی:
                            </label>

                        </div>

                        <div class="form-group">
                            <select wire:model.lazy="brand.parent" name="parent" id="" class="form-control">
                                <option value="-1">--انتخاب دسته</option>
                                @foreach(\App\Models\Category::all() as $category)
                                    <option value="{{$category->id}}">{{$category->title}}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <textarea type="text" placeholder="توضیح برند " class="form-control"
                                      wire:model.lazy="brand.description">
                            </textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="file" wire:model.lazy="img" class="form-control">
                        <span class="mt-2 text-danger" wire:loading wire:target="img">در حال آپلود ...</span>

                        <div wire:ignore class="progress mt-2" id="progressbar" style="display: none">
                            <div class="progress-bar" role="progressbar" style="width: 0%;">0%</div>
                        </div>
                    </div>

                    <div>
                        @if($img)
                            <img style="    width: 200px;" class="form-control mt-3 mb-3" width="400"
                                 src="{{$img->temporaryUrl()}}" alt="">
                        @endif
                    </div>

                    <button type="submit" class="btn btn-brand">آپدیت برند</button>
                </form>
            </div>
        </div>
    </div>
</div>
