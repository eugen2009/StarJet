import 'Model.dart';
import 'dart:async';
import 'dart:html';
import 'GameObject.dart';

class Spaceship extends GameObject{

    double fuel;

    Spaceship(int width, int height, double fuel) : super(width, height){
        this.fuel = fuel;
        super.posX = (window.innerWidth / 2).toInt();
        super.posY = (window.innerHeight * 0.98 - height).toInt();
        move(1, 1);
    }

    @override
    void move(int xAmount, int yAmount){
        print(window.innerWidth);
        print(window.innerHeight);
        print(window.screen.width);
        print(window.screen.height);

        if((this.posX + this.width + xAmount) >= window.innerWidth ){
            this.posX = window.innerWidth - this.width;
        } else if (this.posX + xAmount <= 0){
            this.posX = 0;
        } else {
            this.posX += xAmount;
        }

        if((this.posY + this.height + yAmount) >= window.innerHeight){
            this.posY = (window.innerHeight).toInt() - this.height;
        } else if (this.posY + yAmount <= window.innerHeight*0.8){
            this.posY = (window.innerHeight*0.8).toInt();
        } else {
            this.posY += yAmount;
        }
    }

    void addFuel(double x){
        if((this.fuel + x) >= 100){
            this.fuel = 100.0;
        } else {
            this.fuel += x;
        }
    }

    void consumeFuel(){
        //TODO: timer to consume fuel
        new Timer.periodic(new Duration(milliseconds: 500), (update) {
            this.fuel -= 1;
        });
    }

    void shootLaser(){
        this.fuel -= 10;
    }
}