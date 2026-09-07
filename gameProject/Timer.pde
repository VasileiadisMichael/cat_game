class Timer {
  float Time;

  Timer(float set) { //Constructor when I create a new Timer
    Time = set;
  }

  float getTime() { // returns the current time
    return(Time);
  }

  void setTime(float set) {
    Time = set;
  }

  void countUp() {
    Time += 1/frameRate;
  }
}
