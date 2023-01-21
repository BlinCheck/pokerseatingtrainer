int getDistanceToFish(int currentIndex, int fishIndex, int seatAmount) {
  var distance = currentIndex - fishIndex;

  if (distance < 0) {
    distance = seatAmount + distance;
  }

  return distance;
}