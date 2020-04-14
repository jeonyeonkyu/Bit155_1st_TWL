package Observer_Pattern.Ex1;

public class StatisticsDisplay implements Observer, DisplayElement {
	
	private float temperature;
	private float humidity;
	private float pressure;
	private Subject weatherData;

	public StatisticsDisplay(Subject weatherData) {
		this.weatherData = weatherData;
		this.weatherData.registerObserver(this); // 옵저버 등록
	}

	@Override
	public void display() {
		System.out.println("Statistics Display: " + temperature + "," + humidity + "," + pressure);
	}

	@Override
	public void update(float temp, float humidity, float pressure) {
		this.temperature = temp;
		this.humidity = humidity;
		this.pressure = pressure;
		this.display();
	}

}
