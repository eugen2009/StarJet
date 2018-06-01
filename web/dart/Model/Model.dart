import 'Meteor.dart';
import 'Spaceship.dart';
import 'Fuelstation.dart';
import 'Level.dart';
import 'dart:async';
import 'dart:html';

enum Display{
    display,
    android
}

enum Status{
    started,
    finished,
    onHold
}

class Model{

    var status;
    var display;
    int highscore;

    List<Meteor> m;
    Spaceship s;
    Fuelstation f;
    Level l;

    //List<Shape> m = new List<Shape>();

    Model(Status status, int highscore, Display display){
        status = status;
        this.display = display;
        this.highscore = highscore;

        createObjects();
    }

    void createObjects() {
        s = new Spaceship((window.innerHeight / 10).toInt(), (window.innerHeight/10).toInt() , 100.0);
        f = new Fuelstation.v1((window.innerHeight * 0.95)~/6, ((window.innerHeight * 1.58)~/6), window.innerWidth ~/ 2, -250, s);
        l = new Level(Status.started, 1, 1);

        int position = -80;
        m = new List<Meteor>();
        for(int i = 0; i < (window.innerWidth / (window.innerWidth * 0.075)).round(); i++){
            m.add(new Meteor((window.innerHeight / 10).toInt(),(window.innerHeight / 10).toInt(), s));
            position += (window.innerHeight / 20 + (window.innerHeight / 20)*2).toInt();
            m[i].posX = position;
            m[i].posY = -200;
        }
    }

        void highScoreCounter(){
            //TODO : TimeHandler updating highscore text every second
            new Timer.periodic(new Duration(milliseconds: 1000), (update) {
                highscore++;
            });
        }
    }
