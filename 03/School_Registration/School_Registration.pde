void setup() {
  Student lifeng = new Student("Li Feng Yin", 0, 11);
  Student lixing = new Student("Li Xing Yin", 1, 11);
  Student jeffrey = new Student("Jeffrey Zang", 2, 11);
  Student mike = new Student("Mike Zang", 3, 9);
  Student hooman = new Student("Hooman Reza Nezhad", 4, 12);
  Student dj = new Student("DJ Tomothon", 5, 12);

  Course sph = new Course("SPH3UI", "Mr. Zehr");
  Course tej = new Course("TEJ3MI", "Mr. Webb");
  Course mcv = new Course("MCV4UW", "Mr. Taylor");
  Course mcr = new Course("MCR4UW", "Ms. Zorzitto");
  Course ics = new Course("ICS4UI", "Mr. Schattman");

  sph.addStudent(lifeng);
  sph.describe();
}
