import 'Model.dart';
class Level{

  Status status;
  int level;
  int speedIncrease;

  Level(Status status, int level, int speedIncrease){
      this.status = status;
      this.level = level;
      this.speedIncrease = speedIncrease;
  }


  void setLevel(int x){
      this.level = x;
      speedIncrease = x * 2;
  }

}