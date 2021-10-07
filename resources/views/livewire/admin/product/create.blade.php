@section('title','افزودن محصول')

<div>
    <div class="main-content">
        <div class="row" style="background-color: white">
            <p class="box__title">افزودن محصول جدید</p>
            <form wire:submit.prevent="categoryForm" enctype="multipart/form-data" role="form"
                  class="padding-10 categoryForm">

                @include('errors.error')

                <div class="row">

                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" placeholder="نام محصول " class="form-control"
                                   wire:model.lazy="product.title">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" placeholder="نام انگلیسی محصول " class="form-control"
                                   wire:model.lazy="product.name">
                        </div>
                    </div>
                </div>


                <div class="row">
                    {{--<div class="col-md-6">--}}
                    {{--    <div class="form-group">--}}
                    {{--        <input type="text" wire:model.lazy="product.link" placeholder="لینک محصول "--}}
                    {{--            class="form-control">--}}
                    {{--       </div>--}}
                    {{--</div>--}}

                    <div class="col-md-6">
                        <input type="text" wire:model.lazy="product.number" placeholder="تعداد موجودی محصول "
                               class="form-control">
                    </div>

                    <div class="col-md-6">
                        <input type="text" class="form-control"
                               wire:model.lazy="product.order_count"
                               placeholder="تعداد سفارش محصول(صفر نامحدود)">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <select name="category_id" id="" class="form-control"
                                    wire:model.lazy="product.category_id">
                                <option value="-1">--دسته اصلی</option>
                                @foreach(\App\Models\Category::all() as $category)
                                    <option value="{{$category->id}}">{{$category->title}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <select name="subcategory_id" id="" class="form-control"
                                    wire:model.lazy="product.subcategory_id">
                                <option value="-1">--زیر دسته</option>
                                @foreach(\App\Models\SubCategory::all() as $category)
                                    <option value="{{$category->id}}">{{$category->title}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <select name="childcategory_id" id="" class="form-control"
                                    wire:model.lazy="product.childcategory_id">
                                <option value="-1">--دسته فرزند</option>
                                @foreach(\App\Models\ChildCategory::all() as $category)
                                    <option value="{{$category->id}}">{{$category->title}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <select name="brand_id" id="" class="form-control"
                                    wire:model.lazy="product.brand_id">
                                <option value="-1">برند محصول</option>
                                {{--TODO:brand--}}
                                {{--@foreach(\App\Models\ChildCategory::all() as $category)--}}
                                {{--    <option value="{{$category->id}}">{{$category->title}}</option>--}}
                                {{--@endforeach--}}
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <select name="brand_id" id="" class="form-control"
                                    wire:model.lazy="product.color_id">
                                <option value="-1">رنگ محصول</option>
                                {{--TODO:color--}}
                                {{--@foreach(\App\Models\ChildCategory::all() as $category)--}}
                                {{--    <option value="{{$category->id}}">{{$category->title}}</option>--}}
                                {{--@endforeach--}}
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" placeholder="تگ های محصول " class="form-control"
                                   wire:model.lazy="product.tags">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                            <textarea rows="5" class="form-control" id="description_create"
                                      placeholder="توضیح کوتاه محصول "
                                      wire:model.lazy="product.description">
                            </textarea>
                    </div>

                    <div class="form-group">
                            <textarea name="body" class="form-control" id="body_create"
                                      placeholder="توضیح محصول "
                                      wire:model.lazy="product.body">
                            </textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <input type="text" wire:model.lazy="product.price" placeholder="قیمت محصول "
                               class="form-control">
                    </div>
                    <div class="col-md-4">
                        <input type="text" wire:model.lazy="product.discount_price" placeholder="قیمت تخفیف خورده "
                               class="form-control">
                    </div>

                    <div class="col-md-4">
                        <input type="text" wire:model.lazy="product.weight" placeholder="وزن محصول "
                               class="form-control">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="notificationGroup">
                                <input id="option10" type="checkbox" name="shipment" class="form-control"
                                       wire:model.lazy="product.shipment">
                                <label for="option10">موجود در انبار دیجی کالا:</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="notificationGroup">
                                <input id="option11" type="checkbox" wire:model.lazy="product.publish_product"
                                       name="publish_product"
                                       wire:model.lazy="product.publish_product">
                                <label for="option11">منتشر شده:</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="notificationGroup">
                                <input id="option12" type="checkbox" class="form-control"
                                       wire:model.lazy="product.original"
                                       name="original">
                                <label for="option12">محصول با کیفیت اصلی:</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="notificationGroup">
                                <input id="option13" type="checkbox" class="form-control"
                                       wire:model.lazy="product.gift"
                                       name="gift">
                                <label for="option13">محصول به عنوان هدیه:</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="notificationGroup">
                                <input id="option14" type="checkbox" class="form-control"
                                       wire:model.lazy="product.special"
                                       name="special">
                                <label for="option14">محصول ویژه:</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="notificationGroup">
                                <input id="option4" type="checkbox" name="status_product" class="form-control"
                                       wire:model.lazy="product.status_product">
                                <label for="option4">
                                    نمایش در محصول اصلی:
                                </label>
                            </div>
                        </div>
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
                        <img style="width: 400px" class="form-control mt-3 mb-3" width="400"
                             src="{{$img->temporaryUrl()}}" alt="">
                    @endif
                </div>
                <button class="btn btn-brand">افزودن محصول</button>
            </form>
        </div>
    </div>


    <script>
        ClassicEditor
            .create(document.querySelector('#description_create'), {
                language: {
                    ui: 'fa',
                    content: 'fa'
                }
            })
            .catch(error => {
                console.error(error);
            });

        ClassicEditor
            .create(document.querySelector('#body_create'), {
                language: {
                    ui: 'fa',
                    content: 'fa'
                }
            })
            .catch(error => {
                console.error(error);
            });

        document.addEventListener('livewire:load', () => {
            let progressSection = document.querySelector('#progressbar'),
                progressBar = progressSection.querySelector('.progress-bar');

            document.addEventListener('livewire-upload-start', () => {
                console.log('شروع آپلود');
                progressSection.style.display = 'flex';
            });
            document.addEventListener('livewire-upload-finish', () => {
                console.log('اتمام آپلود');
                progressSection.style.display = 'none';
            });
            document.addEventListener('livewire-upload-error', () => {
                console.log('ارور موقع آپلود');
                progressSection.style.display = 'none';
            });
            document.addEventListener('livewire-upload-progress', (event) => {
                console.log(`${event.detail.progress}%`);
                progressBar.style.width = `${event.detail.progress}%`;
                progressBar.textContent = `${event.detail.progress}%`;
            });
        });
    </script>
</div>
