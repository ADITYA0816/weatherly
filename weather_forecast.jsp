<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="models.WeatherData"%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/forecastpage.css">
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
		ArrayList<WeatherData> weatherDataList = (ArrayList<WeatherData>)request.getAttribute("weatherDataList");
		String cityName = (String)request.getAttribute("cityName");
		WeatherData weatherData = new WeatherData();
	%>

    <div class="bg-img m-0 p-0">
    	<div class="row m-0 p-0">
			<% for(WeatherData weatherForecastData : weatherDataList){ %>
				
				<div class="myCard m-2" style="width: 363px">
				  	<div>
					    <h5 style="text-align: center; color: white"><%= weatherForecastData.getDate()%></h5>
					    <div class="row pl-3 pt-3">
	                		<div class="col-7">
	                			<h6 class="light">Temperature</h6>                		
	                		</div>
	                		<div class="col-5">
	                			<h6 class="light"><%= weatherForecastData.getTempMax()%> / <%= weatherForecastData.getTempMin()%> C</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-3">
	                		<div class="col-7">
	                			<h6 class="light">Pressure (sea/ground)</h6>                		
	                		</div>
	                		<div class="col-5">
	                			<h6 class="light"><%= weatherForecastData.getPressure()%> / <%= weatherForecastData.getGLevelPressure() %> hPa</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-2">
	                		<div class="col-7">
	                			<h6 class="light">Humidity</h6>                		
	                		</div>
	                		<div class="col-5">
	                			<h6 class="light"><%= weatherForecastData.getHumidity()%> %</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-2">
	                		<div class="col-7">
	                			<h6 class="light">Visibility</h6>                		
	                		</div>
	                		<div class="col-5">
	                			<h6 class="light"><%= weatherForecastData.getVisiblility()%> Mtr</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-2">
	                		<div class="col-7">
	                			<h6 class="light">Weather</h6>                		
	                		</div>
	                		<div class="col-5">
	                			<h6 class="light"><%= weatherForecastData.getMain()%> (<%= weatherForecastData.getDescription()%>)</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-2">
	                		<div class="col-7">
	                			<h6 class="light">Clouds</h6>                		
	                		</div>
	                		<div class="col-5">
	                			<h6 class="light"><%= weatherForecastData.getCloud()%> %</h6>
	                		</div>
	                	</div>
	                	<div class="row pl-3 pt-2">
	                		<div class="col-7">
	                			<h6 class="light">Wind</h6>                		
	                		</div>
	                		<div class="col-5">
	                			<h6 class="light"><%= weatherForecastData.getWindSpeed()%> m/s <%= weatherForecastData.getWindDir()%> deg</h6>
	                		</div>
	                	</div>
					</div>
				</div>
			
			<% } %>
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