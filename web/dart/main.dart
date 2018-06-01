import 'dart:html';
import 'dart:async';
import 'View.dart';
import 'Model/Model.dart';
import 'Controller.dart';

Model model;
void main() {
    Display display;
    window.onDeviceOrientation.listen((ev) {
        // No device orientation
        if (ev.alpha == null && ev.beta == null && ev.gamma == null) {
            print("diplay");
            display = Display.display;
        }
        // Device orientation available
        else {
            print("android");
            display = Display.android;
        }
    });

    model = new Model(Status.started, 0, Display.display);
    View view = new View(model);
    new Controller(view, model);

    querySelector("#playButton").onClick.listen(playGame);
    querySelector("#sampleText").text = "test1";

    Timer.run(()=> querySelector("#sampleText").text = new DateTime.now().toString());

}

void playGame(MouseEvent e){

    querySelector("#playButton").style.visibility = "hidden";
    for(int i = 0; i < model.m.length; i++){
        model.m[i].move(0, 2);
    }
    model.f.move(0, 2);
    model.s.consumeFuel();
    model.highScoreCounter();
}


