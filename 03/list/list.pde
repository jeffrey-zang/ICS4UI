void setup() {
  String[] places = { "Canada", "USA", "China", "Mexico" };

  for ( int i = 0; i < places.length; i++ ) {
    println("I've been to ", places[i]);
  }

  // NEW WAY TO STORE DATA
  ArrayList<String> myPlaces = new ArrayList();

  myPlaces.add("South Africa");
  myPlaces.add("Mongolia");
  myPlaces.add("Belarus");

  for (int i = 0; i < myPlaces.size(); i++) {
    println("I've been to". myPlaces.get(i), "\t which is index", i, "in my list");
  }
}