addnumber(double double1, double double2) {
  return double1 + double2;
}

class person {
  String name = 'max';
  int age = 30;
}

void main() {
  var p1 = person();
  var p2 = new person();

  p2.name = 'Alex';
  print(p1.name);
  print(p2.name);
  var firstResult;
  firstResult = addnumber(12.3, 2.7);
  print(firstResult); // hasil 15
  print(firstResult + 1); //hasil 16
  print('success!!');
}
