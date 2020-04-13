//https://jusungpark.tistory.com/8

package Observer_Pattern.Ex1;

public class Main {
	public static void main(String[] args) {
		WeatherData weatherData = new WeatherData();
		CurrentConditions currentConditions = new CurrentConditions(weatherData);
		
	}

}
