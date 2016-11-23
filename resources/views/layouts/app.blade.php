<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Todo Application</title>

    <!-- Fonts -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700" rel='stylesheet' type='text/css'>

    <!-- Styles -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.2.3/css/bulma.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.png">
    <link rel="stylesheet" href="css/app.css">
</head>
<body>

    <section class="hero is-dark">
        <div class="hero-body">
              <div class="container">
                    <h1 class="title">Todo List</h1>
                    <h2 class="subtitle"><em>Submit</em> a new Todo to get started!</h2>
              </div>
        </div>
    </section>

    @yield('content')

</body>
</html>
