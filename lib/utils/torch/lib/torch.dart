import 'dart:async';

import 'package:flutter/services.dart';

class Torch {
  static const MethodChannel _channel =
      const MethodChannel('torch');

  static Future<bool> get hasFlash async {
    return await _channel.invokeMethod('hasFlash');
  }
  static Future<bool> get flashOn async {
    return await _channel.invokeMethod('flashOn');
  }
  static Future<bool> get flashOff async {
    return await _channel.invokeMethod('flashOff');
  }
  static Future<bool> get flashDispose async {
    return await _channel.invokeMethod('flashDispose');
  }
}
