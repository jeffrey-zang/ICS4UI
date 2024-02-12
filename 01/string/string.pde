// given first name last name domain generate email

String generate( String fn, String ln, String domain ) {
  return join(split(fn.toLowerCase(), " "), "") + "." + ln.toLowerCase().toCharArray()[0] + "@" + domain;
}

void setup() {
  // String email = generate( "Li Feng", "Yin", "rythmhacks.ca" );
  // println(email);
  println(generate( "Li Feng", "Yin", "rythmhacks.ca" ));
  println(generate( "Hooman", "Reza Nezhad", "rythmhacks.ca" ));
  println(generate( "Allan", "Joe George", "rythmhacks.ca" ));
  println(generate( "Hooman", "Reza Nezhad", "eclipseexpos.org" ));
}