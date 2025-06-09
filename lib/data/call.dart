



int getRootNumberFromBirthDate(DateTime birthDate) {
  // Step 1: Get the day of the month
  int day = birthDate.day;

  int rootNumber = day;
  while (rootNumber >= 10) {
    rootNumber = rootNumber.toString().split('').map(int.parse).reduce((a, b) => a + b);
  }

  // Step 3: Map root number to planet
  return rootNumber;
}
