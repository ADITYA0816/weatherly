<!DOCTYPE html>
<%@page import="models.WeatherData"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/datapage.css">
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Catamaran:wght@100;500;600&display=swap" rel="stylesheet">
    
    <title>CovidTracker</title>
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
	
	<% 
		WeatherData weatherData = (WeatherData)request.getAttribute("weatherData");
		String cityName = (String)request.getAttribute("cityName");
	%>
	
    <div class="bg-img">
		<div id="main_container" class="container">
	        <div class="row" style="height: 90vh;">
	            <div class="col-md-8 leftcol m-0 p-0">
	            	<div class="row p-0 tempbox justify-content-center" style="margin-top: 450px">           	
	            	
	            		<div class="col-md-3 m-0 p-0 ml-4" style="font-family: 'Catamaran', sans-serif; font-size: 60px">
	            			<%= weatherData.getTemp()%>C
	            		</div>
	            		<div class="col-md-3 m-0 mt-2 p-0 ml-2">
		            		<h1 class="ml-4 m-0 p-0" style="font-family: 'Catamaran', sans-serif;"><%= cityName%></h1>
		            		<h4 class="ml-4" style="font-family: 'Catamaran', sans-serif;"> <%= weatherData.getMain()%><span class="ml-3" style="font-size: 15px; font-family: 'Catamaran', sans-serif;"><%= weatherData.getDescription()%></span></h4>
	            		</div>
	            		<div class="col-md-3 m-0 mt-2 p-0">
		            		<h2 class="ml-4 mt-3" style="font-family: 'Catamaran', sans-serif; font-size:40px"> <%= weatherData.getMain()%></h2>
		            	</div>
	            	</div>
	            </div>
	            <div class="col-md-4 rightcol">
	          		<form class="form-inline pt-5 mt-2 pl-5 pb-2" action="get_weather.do" method="post">
	                    <input class="form-control form-control-md-lg" type="text" name="cityName" placeholder="Another location">
						<button class="btn ml-3" style="background-color: orange"><i class="fa fa-search"></i></button>
	                </form>
	                
	                <div class="ml-2 mt-5">
	                	<h5>Weather Details</h5>
	                	<div class="row pl-3 pt-3">
	                		<div class="col-8">
	                			<h6 class="light">Temperature</h6>                		
	                		</div>
	                		<div class="col-4">
	                			<h6 class="light"><%= weatherData.getTemp()%> C</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-2">
	                		<div class="col-8">
	                			<h6 class="light">Feels like</h6>                		
	                		</div>
	                		<div class="col-4">
	                			<h6 class="light"><%= weatherData.getFeelsLike()%> C</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-2">
	                		<div class="col-8">
	                			<h6 class="light">Clouds</h6>                		
	                		</div>
	                		<div class="col-4">
	                			<h6 class="light"><%= weatherData.getCloud()%> %</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-3">
	                		<div class="col-8">
	                			<h6 class="light">Humidity</h6>                		
	                		</div>
	                		<div class="col-4">
	                			<h6 class="light"><%= weatherData.getHumidity()%> %</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-3">
	                		<div class="col-8">
	                			<h6 class="light">Pressure</h6>                		
	                		</div>
	                		<div class="col-4">
	                			<h6 class="light"><%= weatherData.getPressure()%> hPa</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-3">
	                		<div class="col-8">
	                			<h6 class="light">Visibility</h6>                		
	                		</div>
	                		<div class="col-4">
	                			<h6 class="light"><%= weatherData.getVisiblility()%> Mtr</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-3">
	                		<div class="col-8">
	                			<h6 class="light">Wind speed</h6>                		
	                		</div>
	                		<div class="col-4">
	                			<h6 class="light"><%= weatherData.getWindSpeed()%> m/s</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-3">
	                		<div class="col-8">
	                			<h6 class="light">Wind direction</h6>                		
	                		</div>
	                		<div class="col-4">
	                			<h6 class="light"><%= weatherData.getWindDir()%> Degs</h6>
	                		</div>
	                	</div>
	                </div>
	                
	                <a href="get_weather_forecast.do?cityName=${cityName}" class="btn btn-secondary float-right mt-4">Weather Forecast</a>
	            </div>
	            
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