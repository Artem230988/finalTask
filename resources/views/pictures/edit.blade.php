@extends('layouts.layout')

@section('content')

	<form action="{{ route('picture.update', ['id'=>$picture->picture_id]) }}" method="post" enctype="multipart/form-data">
		@csrf
		@method('PATCH')
		<h4>Редактировать теги</h4><br>
		<div class="form-group">
			<h7>Введите теги к картинке:</h7>
			<textarea class="form-control" name="tag" rows="3" required>{{ $picture->tag }}</textarea>
		</div>

		<input type="submit" value="Изменить теги" class="btn btn-outline-success">

	</form>

@endsection
