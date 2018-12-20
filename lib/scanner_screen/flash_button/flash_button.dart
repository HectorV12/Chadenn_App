import 'package:chadenn/scanner_screen/scanner.dart';
import 'package:chadenn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:torch/torch.dart';

class FlashButton extends StatefulWidget {
  @override
  _FlashButtonState createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton> {
  bool _hasFlash = false;
  bool _isOn = false;
  @override
  initState() {
    initPlatformState();
    super.initState();
  }

  @override
  void dispose() {
    // make sure release any resources held by the torch
    Torch.flashDispose;
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    bool hasFlash = false;
    try {
      hasFlash = await Torch.hasFlash;
    } on PlatformException {
      print('Failed to see if has flash.');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _hasFlash = hasFlash;
    });
  }

  Future _turnFlash() async {
//    hasScanned = false;
//    qrCameraKey.currentState.restart();
    _isOn ? await Torch.flashOff : await Torch.flashOn;
    setState(() {
      _isOn = !_isOn;
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
            //TODO: Fix Flashlight
            onPressed: () {},
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
}
