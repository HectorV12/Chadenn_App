import Flutter
import AVFoundation
import UIKit

public class SwiftTorchPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "torch", binaryMessenger: registrar.messenger())
    let instance = SwiftTorchPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if ("hasFlash" == call.method) {
      result(hasFlash())
    } 
    else if ("flashOn" == call.method) {
      flashOn()
      result(nil)
    } else if ("flashOff" == call.method) {
      flashOff()
      result(nil)
    } else if ("flashDispose" == call.method) {
      flashDispose()
      result(nil) 
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  func hasFlash() -> Bool {
    let device = AVCaptureDevice.default(for: .video)
    if (device == nil) {
      return (false)
    }
    return (device!.hasTorch && device!.hasFlash)
  }

  func flashOn() {
    if (hasFlash()) {
      let device = AVCaptureDevice.default(for: .video)
      do {
          try device!.lockForConfiguration()
          device!.torchMode = .on
          device!.unlockForConfiguration()
      } catch {
          print("Torch could not be used")
      }    
    }
  }

  func flashOff() {
    if (hasFlash()) {
      let device = AVCaptureDevice.default(for: .video)
      do {
          try device!.lockForConfiguration()
          device!.torchMode = .off
          device!.unlockForConfiguration()
      } catch {
          print("Torch could not be used")
      }    
    }
  }

  func flashDispose() {
    flashOff()
  }
}
