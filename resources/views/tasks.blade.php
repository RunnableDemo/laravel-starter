@extends('layouts.app')

@section('content')
<div class="container todo-list">

    @if (count($tasks) < 1)
    <p>There are no todos!</p>
    @endif

    @foreach ($tasks as $task)
    <article class="media">
        <div class="media-content">
            <div class="content">
                <p>
                    {{ $task->name }}
                </p>
            </div>
        </div>
        <div class="media-right">
            <form action="{{ url('task/'.$task->id) }}" method="POST">
                {{ csrf_field() }}
                {{ method_field('DELETE') }}
                <input type="submit" value="Delete" class="button is-danger" />
            </form>
        </div>
    </article>                    
    @endforeach

    <form action="{{ url('task')}}" method="POST" class="addTodo">
        {{ csrf_field() }}        
        <input type="text" autofocus="autofocus" placeholder="Add a Todo!" name="name" id="task-name" value="{{ old('task') }}">
        <input type="submit" value="Submit" class="button is-dark is-fullwidth" />
    </form>

    @include('common.errors')

</div>
@endsection
