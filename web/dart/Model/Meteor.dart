import 'GameObject.dart';
import 'Model.dart';
import 'Spaceship.dart';
import 'dart:async';
import 'dart:html';
import 'dart:math';

class Meteor extends GameObject {

    int intervall;
    Spaceship s;
    bool collision = false;

    Meteor(int width, int height, Spaceship s): super(width, height){
        this.s = s;
    }


    void move(int x, int y){

        var random = new Random();
        bool sleep = true;
        intervall = random.nextInt(20) + 5;
        new Timer.periodic(new Duration(milliseconds: intervall), (update) {
            if(sleep){
                intervall = 1;
                sleep = false;
            }
            this.posY += y;
            if(this.posY >= window.innerHeight){
                this.posY = -100;
            }
            if(isCollision()){
                collision = true;
                update.cancel();
            }
        });
    }
    
    bool isCollision(){

        if((this.posY > window.innerHeight * 0.65) &&
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