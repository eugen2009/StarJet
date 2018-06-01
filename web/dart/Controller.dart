import 'View.dart';
import 'dart:html';
import 'dart:async';
import 'Model/Model.dart';
import 'dart:math';

class Controller {
  Model model;
  View view;
  static bool firstPressX = true;
  static bool firstPressY = true;

  Controller(View view, Model model) {
    this.view = view;
    this.model = model;
    deviceListener();
    actionListenerRL();
    actionListenerUD();
  }

  void deviceListener(){
      window.onDeviceOrientation.listen((ev) {
          this.model.s.move(ev.gamma.round(), ev.beta.round() - 30);
          this.view.updateSpaceship();
      });
  }

  void actionListenerRL() {
    window.onKeyDown.listen((KeyboardEvent e) {
      if (e.keyCode == KeyCode.RIGHT && firstPressX) {
        firstPressX = false;
        final move =
            new Timer.periodic(new Duration(milliseconds: 1), (update) {
          model.s.move(3, 0);
          this.view.updateSpaceship();
        });
        window.onKeyUp.listen((KeyboardEvent e) {
          if (e.keyCode == KeyCode.RIGHT) {
            move.cancel();
            firstPressX = true;
          }
        });
      }
      if (e.keyCode == KeyCode.LEFT && firstPressX) {
        firstPressX = false;
        final move =
            new Timer.periodic(new Duration(milliseconds: 1), (update) {
          model.s.move(-3, 0);
          this.view.updateSpaceship();
        });
        window.onKeyUp.listen((KeyboardEvent e) {
          if (e.keyCode == KeyCode.LEFT) {
            move.cancel();
            firstPressX = true;
          }
        });
      }
    });
  }

  void actionListenerUD() {
    window.onKeyDown.listen((KeyboardEvent e) {
      if (e.keyCode == KeyCode.UP && firstPressY) {
        firstPressY = false;
        final move =
            new Timer.periodic(new Duration(milliseconds: 1), (update) {
          model.s.move(0, -1);
          this.view.updateSpaceship();
        });
        window.onKeyUp.listen((KeyboardEvent e) {
          if (e.keyCode == KeyCode.UP) {
            move.cancel();
            firstPressY = true;
          }
        });
      }
      if (e.keyCode == KeyCode.DOWN && firstPressY) {
        firstPressY = false;
        final move =
            new Timer.periodic(new Duration(milliseconds: 1), (update) {
          model.s.move(0, 1);
          this.view.updateSpaceship();
        });
        window.onKeyUp.listen((KeyboardEvent e) {
          if (e.keyCode == KeyCode.DOWN) {
            move.cancel();
            firstPressY = true;
          }
        });
      }
    });
  }
}
