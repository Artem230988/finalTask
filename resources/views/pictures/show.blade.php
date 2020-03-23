@extends('layouts.layout')

@section('content')

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header"><h5>{{ $picture->tag }}</h5></div>
				<div class="card-body">
					<div class="card-img card-img__max" style="background-image: url({{ $picture->img ?? asset('img/3.JPG') }})"></div>
					<div class="card-count">Количество просмотров: {{ $picture->countViews }}</div>
					<div class="card-author">Автор: {{ $picture->name }}</div>
					<div class="card-btn">
						<a href="{{ route('picture.index') }}" class="btn btn-outline-primary">На главную</a>
						@auth
						@if(Auth::user()->id == $picture->author_id)
						<a href="{{ route('picture.edit', ['id'=> $picture->picture_id]) }}" class="btn btn-outline-primary">Изменить теги</a>
						<form action="{{ route('picture.destroy', ['id'=> $picture->picture_id]) }}" method="post">
							@csrf
							@method('DELETE')
							<input type="submit" class="btn btn-outline-danger" name="" value="Удалить">
						</form>
						@endif
						@endauth
					</div>	
					
				</div>
			</div>
		</div>
	</div>


@endsection
