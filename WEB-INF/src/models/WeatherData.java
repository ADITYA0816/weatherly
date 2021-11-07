package models;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

public class WeatherData {
	Integer visiblility;
	String main;
	String description;
	BigDecimal  temp;
	BigDecimal  tempMin;
	BigDecimal  tempMax;
	Integer humidity;
	Integer pressure;
	Integer gLevelPressure;
	BigDecimal  feelsLike;	
	BigDecimal  windSpeed;	
	Integer  windDir;
	Integer  cloud;
	String date;

	public WeatherData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WeatherData(Integer visiblility, String main, String description, BigDecimal temp, Integer humidity,
			Integer pressure, BigDecimal feelsLike, BigDecimal  windSpeed, Integer  windDir, Integer  cloud) {
		super();
		this.visiblility = visiblility;
		this.main = main;
		this.description = description;
		this.temp = temp;
		this.humidity = humidity;
		this.pressure = pressure;
		this.feelsLike = feelsLike;
		this.windSpeed = windSpeed;
		this.windDir = windDir;
		this.cloud = cloud;
	}

	public WeatherData(BigDecimal temp, BigDecimal feels_like, BigDecimal temp_min, BigDecimal temp_max,
			Integer pressure, Integer gLevelPressure, Integer humidity, String main, String description,
			Integer clouds, BigDecimal windSpeed, Integer windDeg, Integer visibility, String dt_txt) {
		super();
		this.temp = temp;
		this.feelsLike = feels_like;
		this.tempMin = temp_min;
		this.tempMax = temp_max;
		this.pressure = pressure;
		this.gLevelPressure = gLevelPressure;
		this.humidity = humidity;
		this.main = main;
		this.description = description;
		this.cloud = clouds;
		this.windSpeed = windSpeed;
		this.windDir = windDeg;
		this.visiblility = visibility;
		this.date = dt_txt;
	}

	public static WeatherData getData(String cityName) throws IOException, InterruptedException{
		var url = "https://api.openweathermap.org/data/2.5/weather?q="+cityName+"&APPID=e83939363ad842bef66625ccaf56b851&units=metric";
		
		HttpClient client = HttpClient.newBuilder().build();
		
		HttpRequest request = HttpRequest.newBuilder().GET().uri(URI.create(url)).build();
		
		HttpResponse<String> resp = client.send(request, HttpResponse.BodyHandlers.ofString());
		
		JSONObject obj = new JSONObject(resp.body());
		
		JSONObject mainObj = (JSONObject)obj.get("main");

		Integer visibility = (Integer)obj.get("visibility");
		
		JSONArray weather = (JSONArray)obj.get("weather");
		JSONObject weatherObj = weather.getJSONObject(0);
		String main = (String)weatherObj.get("main");
		
		String description = (String)weatherObj.get("description");
		
		Number n = (Number)mainObj.get("temp");
		BigDecimal  temp = new BigDecimal(n.toString());
		
		Integer humidity = (Integer)mainObj.get("humidity");
		
		Integer pressure = (Integer)mainObj.get("pressure");
		
		Number n2 = (Number)mainObj.get("feels_like");
		BigDecimal  feels_like = new BigDecimal(n2.toString());
		
		JSONObject windObj = (JSONObject)obj.get("wind");
		
		Number n3 = (Number)windObj.get("speed");
		BigDecimal  windSpeed = new BigDecimal(n3.toString());
		
		Integer  windDeg = (Integer)windObj.get("deg");
		
		JSONObject cloudObj= (JSONObject)obj.get("clouds");
		Integer  cloud = (Integer)cloudObj.get("all");
		
		WeatherData weatherDataObj = new WeatherData(visibility,main,description,temp,humidity,pressure,feels_like,windSpeed,windDeg,cloud);
		
		return weatherDataObj;
	}
	
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public static ArrayList<WeatherData> getForecastData(String cityName) throws IOException, InterruptedException{
		
		ArrayList<WeatherData> weatherForecastList = new ArrayList<WeatherData>();
		
		var url = "https://api.openweathermap.org/data/2.5/forecast?q="+cityName+"&APPID=e83939363ad842bef66625ccaf56b851&units=metric";
		
		HttpClient client = HttpClient.newBuilder().build();
		
		HttpRequest request = HttpRequest.newBuilder().GET().uri(URI.create(url)).build();
		
		HttpResponse<String> resp = client.send(request, HttpResponse.BodyHandlers.ofString());
		
		JSONObject obj = new JSONObject(resp.body());
		JSONArray weatherList = (JSONArray)obj.get("list");
		System.out.println(weatherList.getJSONObject(0));
		
		for(int i=0;i<23;i++) {
			JSONObject weatherObj = weatherList.getJSONObject(i);
			
			JSONObject mainObj = (JSONObject)weatherObj.get("main");
			Number n = (Number)mainObj.get("temp");
			BigDecimal  temp = new BigDecimal(n.toString());
			
			Number n1 = (Number)mainObj.get("feels_like");
			BigDecimal  feels_like = new BigDecimal(n1.toString());
			
			Number n2 = (Number)mainObj.get("temp_min");
			BigDecimal  temp_min = new BigDecimal(n2.toString());
			
			Number n3 = (Number)mainObj.get("temp_max");
			BigDecimal  temp_max = new BigDecimal(n3.toString());
			
			Integer pressure = (Integer)mainObj.get("pressure");
			Integer gLevelPressure = (Integer)mainObj.get("grnd_level");
			Integer humidity = (Integer)mainObj.get("humidity");
			
			
			JSONArray weather = (JSONArray)weatherObj.get("weather");
			JSONObject weatherOb = weather.getJSONObject(0);
			String main = (String)weatherOb.get("main");
			String description = (String)weatherOb.get("description");
			
			JSONObject cloudObj = (JSONObject)weatherObj.get("clouds");
			Integer clouds = (Integer)cloudObj.get("all");
			
			JSONObject windObj = (JSONObject)weatherObj.get("wind");
			Number n4 = (Number)windObj.get("speed");
			BigDecimal  windSpeed = new BigDecimal(n4.toString());
			Integer windDeg = (Integer)windObj.get("deg");
			
			Integer visibility = (Integer)weatherObj.get("visibility");
			String dt_txt = (String)weatherObj.get("dt_txt");
			
			
			WeatherData weatherDataObj = new WeatherData(temp,feels_like,temp_min,temp_max,pressure,gLevelPressure,humidity,main,description,clouds,windSpeed,windDeg,visibility,dt_txt);
			
			weatherForecastList.add(weatherDataObj);
			i+=2;
		}		
		return weatherForecastList;
	}
	
	
	
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public Integer getVisiblility() {
		return visiblility;
	}

	public void setVisiblility(Integer visiblility) {
		this.visiblility = visiblility;
	}

	public String getMain() {
		return main;
	}

	public void setMain(String main) {
		this.main = main;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getTemp() {
		return temp;
	}

	public void setTemp(BigDecimal temp) {
		this.temp = temp;
	}

	public Integer getHumidity() {
		return humidity;
	}

	public void setHumidity(Integer humidity) {
		this.humidity = humidity;
	}

	public Integer getPressure() {
		return pressure;
	}

	public void setPressure(Integer pressure) {
		this.pressure = pressure;
	}

	public BigDecimal getFeelsLike() {
		return feelsLike;
	}

	public void setFeelsLike(BigDecimal feelsLike) {
		this.feelsLike = feelsLike;
	}

	public BigDecimal getWindSpeed() {
		return windSpeed;
	}

	public void setWindSpeed(BigDecimal windSpeed) {
		this.windSpeed = windSpeed;
	}

	public Integer getWindDir() {
		return windDir;
	}

	public void setWindDir(Integer windDir) {
		this.windDir = windDir;
	}

	public Integer getCloud() {
		return cloud;
	}

	public void setCloud(Integer cloud) {
		this.cloud = cloud;
	}

	public BigDecimal getTempMin() {
		return tempMin;
	}

	public void setTempMin(BigDecimal tempMin) {
		this.tempMin = tempMin;
	}

	public BigDecimal getTempMax() {
		return tempMax;
	}

	public void setTempMax(BigDecimal tempMax) {
		this.tempMax = tempMax;
	}

	public Integer getGLevelPressure() {
		return gLevelPressure;
	}

	public void setGLevelPressure(Integer gLevelPressure) {
		this.gLevelPressure = gLevelPressure;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}

