@extends('layouts.layout')

@section('content')
<h2>Мои картинки</h2><br>
<div class="container">
  <div class="row">
    @if(count($pictures) == 0)
      <h5>Вы еще не загрузили ни одной картинки</h5>
    @endif

    @foreach($pictures as $picture)
    <div class="col-6">
      <div class="card">
        <div class="card-header"><h5>{{ $picture->tag }}</h5></div>
        <div class="card-body">
          <div class="card-img" style="background-image: url({{ $picture->img ?? asset('img/3.JPG')}})"></div>
          <div class="card-author">Автор: {{ $picture->name }}</div>
          <a href="{{ route('picture.show', ['id' => $picture->picture_id]) }}" class="btn btn-outline-primary">Посмотреть картинку</a>
        </div>
      </div>
    </div>
    @endforeach
  </div>


  {{ $pictures->links() }}

@endsection

