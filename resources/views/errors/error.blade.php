@if($errors->any())

    <div class="alert alert-danger">
        <ui>
            @foreach($errors->all() as $error)
                <li>
                    {{$error}}
                </li>
            @endforeach
        </ui>
    </div>

@endif
