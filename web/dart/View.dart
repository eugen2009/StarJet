import 'dart:html';
import 'dart:math';
import 'Model/Model.dart';
import 'dart:async';

class View{

    int topAmount = 0;
    int spaceShipMove = 0;

    List meteors = new List();

    final meteor = querySelector("#meteor");
    final spaceship = querySelector("#spaceship");
    final fuelstation = querySelector("#fuelstation");
    final fuelText = querySelector("#fuelText");
    final highscoreText = querySelector("#highscoreText");
    final body = querySelector("#body");

    Model model;

    View(Model model){
        this.model = model;
        ticker();
        defineObjects();
    }

    void defineObjects(){
        final round = "50px";

        for(int i = 0; i < model.m.length; i++){
            meteors.add(new DivElement());
            meteor.children.add(meteors[i]);
            meteor.children[i].style.width="${this.model.m[i].width}px";
            meteor.children[i].style.height="${this.model.m[i].height}px";
            meteor.children[i].style.top="${this.model.m[i].posY}px";
            meteor.children[i].style.left="${this.model.m[i].posX}px";
            meteor.children[i].style.color="WHITE";
            meteor.children[i].style.position="absolute";
            meteor.children[i].style.backgroundImage="url('../res/meteor.png')";
            meteor.children[i].style.backgroundSize="cover";
            meteor.children[i].style.borderRadius = round;
        }

        this.fuelstation.style.width="${this.model.f.width}px";
        this.fuelstation.style.height="${this.model.f.height}px";
        this.fuelstation.style.top="${this.model.f.posY}px";
        this.fuelstation.style.left="${this.model.f.posX}px";
        this.fuelstation.style.color="GREEN";
        this.fuelstation.style.borderRadius = round;

        this.spaceship.style.width="${this.model.s.width}px";
        this.spaceship.style.height="${this.model.s.height}px";
        this.spaceship.style.top="${this.model.s.posY}px";
        this.spaceship.style.left="${this.model.s.posX}px";
        this.spaceship.style.color="RED";

    }

    void ticker(){
        new Timer.periodic(new Duration(milliseconds: 1), (update) {
            updateMeteors();
            updateFuelstation();
            updateFuel();
            updateCollisionStatus();
            updateHighscore();
        });
    }

    void updateMeteors(){
        for(int i = 0; i < meteors.length; i++){
            this.meteors[i].style.top ="${this.model.m[i].posY}px";
            if(this.model.m[i].collision){
                this.spaceship.style.visibility="false";
            }
        }
    }

    void updateSpaceship(){
        this.spaceship.style.left="${this.model.s.posX}px";
        this.spaceship.style.top ="${this.model.s.posY}px";
    }

    void updateFuelstation(){
        //TODO: update div to this.model.f.dy
        this.fuelstation.style.left="${this.model.f.posX}px";
        this.fuelstation.style.top ="${this.model.f.posY}px";
    }

    void updateHighscore(){
        //TODO: update certain text to this.model.highscore
        this.highscoreText.text="Highscore: ${this.model.highscore}";
    }

    void updateFuel(){
        //TODO: update certain text to this.model.s.fuel
        this.fuelText.text = "Fuel: ${this.model.s.fuel.toStringAsFixed(1)}";

    }

    void updateCollisionStatus(){
        //TODO: update all Collisions
    }

    void transition(){
        //TODO: stop all moving objects, spaceship to middle, no meteors, level shown in center as text.
    }

    void endGame(){
        //TODO: Gameover screen, stop all moving objects, show highscore
    }

    int get size => min(this.width, this.height);

    int get width => window.innerWidth;

    int get height => window.innerHeight;
}