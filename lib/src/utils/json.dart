bool isCompleteJson(String jsonString) {
  int numOpenCurly = 0;
  int numClosedCurly = 0;
  int numOpenSquare = 0;
  int numClosedSquare = 0;

  for (int i = 0; i < jsonString.length; i++) {
    switch (jsonString[i]) {
      case '{':
        numOpenCurly++;
        break;
      case '}':
        numClosedCurly++;
        break;
      case '[':
        numOpenSquare++;
        break;
      case ']':
        numClosedSquare++;
        break;
    }
  }

  return numOpenCurly == numClosedCurly && numOpenSquare == numClosedSquare;
}
