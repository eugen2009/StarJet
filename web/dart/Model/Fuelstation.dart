import 'GameObject.dart';
import 'Model.dart';
import 'dart:math';
import 'Spaceship.dart';
import 'dart:async';
import 'dart:html';

class Fuelstation extends GameObject{

    int intervall;
    Spaceship s;

    Fuelstation(int posWidth, int posHeight, this.s) : super(posWidth, posHeight);
    Fuelstation.v1(int posWidth, int posHeight, int posX, int posY, this.s) : super.v1(posWidth, posHeight, posX, posY);

    @override
    void move(int x, int y){
        var random = new Random();
        bool sleep = true;
        intervall = 30;
        new Timer.periodic(new Duration(milliseconds: 15), (update) {
            if(sleep){
                //intervall = 1;
                sleep = false;
            }
            this.posY += y;
            if(this.posY >= window.innerHeight){
                this.posY = -200;
            }
            if(isCollision()) s.addFuel(0.3);

        });
    }
    bool isCollision(){
        if(
        (this.posY > window.innerHeight * 0.40) &&
            ((this.posX < (s.posX + s.width) &&
                this.posX > s.posX) ||
                ((this.posX + this.width) < (s.posX + s.width) &&
                    (this.posX + this.width) > s.posX) || (this.posX < s.posX && s.posX < (this.posX + this.width))) &&
            ((this.posY < (s.posY + s.height) && this.posY > s.posY) ||
                ((this.posY + this.height) < (s.posY + s.height) &&
                    (this.posY + this.height) > s.posY) || (this.posY < s.posY && s.posY < (this.posY + this.height))))
        {
            return true;
        }
        return false;
    }

}