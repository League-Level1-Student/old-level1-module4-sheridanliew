package extra;

public class Athlete {
	static int count;
	static String raceLocation = "New York";
	static String raceStartTime = "9:00am";

	String name;
	int speed;
	int bibNumber;

	Athlete(String name, int speed) {
		this.name = name;
		this.speed = speed;
		this.bibNumber = count + 1;
		count++;
	}

	public static void main(String[] args) {
		// create two athletes
		// print their names, bibNumbers, and the location of their race. }
		raceLocation = "California";
		System.out.println("LOCATION: " + raceLocation + "");
		System.out.println("START TIME: " + raceStartTime + "");
		Athlete athlete1 = new Athlete("Sophie", 8);
		System.out.println("Athlete Name: " + athlete1.name + ", Speed: " + athlete1.speed + ", Bib Number: "
				+ athlete1.bibNumber + ", Location: " + raceLocation + "");
		Athlete athlete2 = new Athlete("Lauren", 10);
		System.out.println("Athlete Name: " + athlete2.name + ", Speed: " + athlete2.speed + ", Bib Number: "
				+ athlete2.bibNumber + ", Location: " + raceLocation + "");
	}
}