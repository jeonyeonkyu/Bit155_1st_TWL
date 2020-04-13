//https://jusungpark.tistory.com/8

package Observer_Pattern.Ex1;

public class Main {
	public static void main(String[] args) {
		WeatherData weatherData = new WeatherData();
		CurrentConditions currentConditions = new CurrentConditions(weatherData);
		StatisticsDisplay statisticsDisplay = new StatisticsDisplay(weatherData);
		ForecastDisplay forecastDisplay = new ForecastDisplay(weatherData);
		
		weatherData.setMeasurementsChanged(85, 62, 36.7f);
		
	}

	
}
