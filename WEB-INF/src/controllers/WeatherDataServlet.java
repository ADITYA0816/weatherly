package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.WeatherData;

public class WeatherDataServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String cityName = request.getParameter("cityName");
		WeatherData weatherData = null;
		
		try {
			weatherData = WeatherData.getData(cityName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("weatherData", weatherData);
		request.setAttribute("cityName", cityName.toUpperCase());
		
		String nextPage = "weather_data.jsp";
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}