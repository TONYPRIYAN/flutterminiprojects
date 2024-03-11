import 'dart:math';

class calculate {

  calculate({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi=0;



  String Calculate()
  {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String Category() {
    if (_bmi < 16) {
      return "Underweight Prodigy: Fuel up for greatness!";
    } else if (_bmi < 18.5) {
      return "Lean Mean Machine: Boost with extra awesomeness!";
    } else if (_bmi <= 24.9) {
      return "Body Harmony Achiever: Nailing the normal weight!";
    } else if (_bmi <= 29.9) {
      return "Muscle Maverick: Trim the excess, stay epic!";
    } else {
      return "Obesity Avenger: Time to redefine your superhero physique!";
    }
  }

  String Msg() {
    if (_bmi < 16) {
      return "Feast Mode Activated: Your body craves epic fuel!";
    } else if (_bmi < 18.5) {
      return "Snack Masterclass: Spoil yourself with a touch of awesome!";
    } else if (_bmi <= 24.9) {
      return "Balance Guru: Maintain the Zen of your body!";
    } else if (_bmi <= 29.9) {
      return "Lighten the Load: Find the epic balance in bites!";
    } else {
      return "Sculptor of Awesomeness: Time to craft your superhero physique!";
    }
  }





}

