@extends('layouts.layout')

@section('content')

	<form action="{{ route('picture.store') }}" method="post" enctype="multipart/form-data">
		@csrf
		<h4>Создать пост</h4><br>
		<div class="form-group">
			<h7>Введите теги к картинке:</h7>
			<textarea class="form-control" name="tag" rows=3 required></textarea>
		</div>

		<div class="form-group">
			<input type="file" name="img[]" multiple required>
		</div>

		<input type="submit" value="Загрузить свои картинки" class="btn btn-outline-success">

	</form>

@endsection
