package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.WeatherData;

public class WeatherForecastServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String cityName = request.getParameter("cityName");
		
		ArrayList<WeatherData> weatherDataList = null;
		
		try {
			weatherDataList = WeatherData.getForecastData(cityName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("weatherDataList", weatherDataList);
		request.setAttribute("cityName", cityName);
		
		String nextPage = "weather_forecast.jsp";
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}