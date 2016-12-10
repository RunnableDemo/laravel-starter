@extends('layouts.app')

@section('content')
  <div class="container">
    
    <div class="notification">
      <div class="emoji">🚀</div>
      <div>
        <p class="weight-strong">This is your demo app.</p>
        <p class="small">Each branch gets its own database. Check it out and then head back to Runnable.</p>
      </div>
    </div>

    <h1 class="h1">Todo List</h1>

    <ul class="todo-list">

      @foreach ($tasks as $task)
      <li class="todo-list-item">
        <form action="{{ url('task/'.$task->id) }}" method="POST">
            {{ csrf_field() }}
            {{ method_field('DELETE') }}
            <input type="submit" value=" " class="button-complete" />
        </form>
        {{ $task->name }}
      </li>
      @endforeach

      <form action="{{ url('task')}}" method="POST" class="add-todo">
        {{ csrf_field() }}        
        <input type="text" autofocus="autofocus" placeholder="Add a Task" name="name" id="task-name" value="{{ old('task') }}" class="todo-list-item input" >
      </form>

    </ul>

    @include('common.errors')

    </div>
  </div>
@endsection
