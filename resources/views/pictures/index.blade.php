@extends('layouts.layout')

@section('content')

	@if(isset($_GET['search']))
		@if(count($pictures)>0)
			<h2>Результаты поиска по запросу: "<?=$_GET['search']?>"</h2><br>
			
		@else
			<h2>По запросу "<?=htmlspecialchars($_GET['search'])?>" ничего не найдено</h2>
		@endif
	@endif

	<div class="row">
		@foreach($pictures as $picture)

		<div class="col-6">
			<div class="card">
				<div class="card-header"><h5>{{ $picture->tag }}</h5></div>
				<div class="card-body">
					<div class="card-img" style="background-image: url({{ $picture->img ?? asset('img/3.JPG') }})"></div>
					<div class="card-author">Автор: {{ $picture->name }}</div>
					<div class="card-count">Количество просмотров: {{ $picture->countViews }}</div>
					<a href="{{ route('picture.show', ['id' => $picture->picture_id]) }}" class="btn btn-outline-primary">Посмотреть картинку</a>
				</div>
			</div>
		</div>
		@endforeach
	</div>

	
	@if(!isset($_GET['search']))
	{{ $pictures->links() }}
	@endif

@endsection
