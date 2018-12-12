import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';

class FlashButton extends StatefulWidget {
  @override
  _FlashButtonState createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton> {
  bool _hasFlash = false;
  bool _isOn = false;
  double _intensity = 1.0;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    bool hasFlash = await Lamp.hasLamp;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlash = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'Flash',
            onPressed: _turnFlash,
            child: Icon(_isOn ? Icons.flash_off : Icons.flash_on),
            backgroundColor: chadenn_color,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Text(
            _isOn ? 'Flash Off' : 'Flash On',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  Future _turnFlash() async {
    _isOn ? Lamp.turnOff() : Lamp.turnOn(intensity: _intensity);
    var f = await Lamp.hasLamp;
    setState(() {
      _hasFlash = f;
      _isOn = !_isOn;
    });
  }
}
