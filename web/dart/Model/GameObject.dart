abstract class GameObject{

  int width;
  int height;
  int posX;
  int posY;

  GameObject(int width, int height){
      this.width = width;
      this.height = height;
  }

  GameObject.v1(int width, int height, int posX, int posY) {
    this.width = width;
    this.height = height;
    this.posX = posX;
    this.posY = posY;
  }


  void move(int posX, int posY){
      this.posX = posX;
      this.posY = posY;
  }

  void setSize(int width, int height){
      this.width = width;
      this.height = height;
  }


}