<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Catamaran:wght@100;500;600&display=swap" rel="stylesheet">
    <title>Weatherly</title>
</head>

<body>
	
    <nav class="navbar p-0 px-4">
        <div class="brand-title" style="font-family: 'Catamaran', sans-serif;"><i class="fa fa-cloud mr-2"></i>Weatherly</div>
        <a href="#" class="toggle-button mt-2">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </a>
        <div class="navbar-links">
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
    </nav>
    
    <div id="main_container" class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <h3 class="proj_title">
                    Weatherly
                </h3>
                <h5>
                    Get Weather Around The Globe
                </h5>
            </div>
            <div class="col-md-6 col-sm-12">
                <form action="get_weather.do" method="post">
                    <input class="form-control form-control-md-lg" type="text" name="cityName" placeholder="Search for city...">
                    <button class="btn btn-success mt-2">Search</button>
                </form>
            </div>
        </div>
        
	</div>

    <script>
        const toggleButton = document.getElementsByClassName('toggle-button')[0]
        const navbarLinks = document.getElementsByClassName('navbar-links')[0]

        toggleButton.addEventListener('click', () => {
            navbarLinks.classList.toggle('active')
        })
    </script>

</body>


</html>