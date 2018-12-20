package uk.co.torch.torch;

import android.hardware.Camera;
import android.content.pm.PackageManager;
import android.Manifest;
import android.os.Build;
import android.graphics.Rect;
import android.view.Window;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** TorchPlugin */
public class TorchPlugin implements MethodCallHandler {
  /** Plugin registration. */
  static private Camera _camera = null;
  static private Registrar _registrar = null;

  public static void registerWith(Registrar registrar) {

    _registrar = registrar;

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
       if (_registrar.activity().checkSelfPermission(Manifest.permission.CAMERA) == PackageManager.PERMISSION_DENIED) {
        _registrar.activity().requestPermissions(new String[] {Manifest.permission.CAMERA, Manifest.permission.RECORD_AUDIO}, 101);
       }
    }
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "torch");
    channel.setMethodCallHandler(new TorchPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("hasFlash")) {
      boolean res = _registrar.context().getApplicationContext().getPackageManager().hasSystemFeature(PackageManager.FEATURE_CAMERA_FLASH);
      result.success(res);
    } 
    else if (call.method.equals("flashOn")) {
      boolean res = false;
      try {
        if (_camera == null) {
          _camera = Camera.open();
        }
        if (_camera != null) {
          Camera.Parameters params = _camera.getParameters();
          params.setFlashMode(Camera.Parameters.FLASH_MODE_TORCH);
          _camera.setParameters(params);
          _camera.startPreview();
          res = true;
        }
      } catch (Exception e) {
        System.out.println("Failed to get camera : " + e.toString());
      }
      result.success(res);
    } 
    else if (call.method.equals("flashOff")) {
      boolean res = false;
      try {
        if (_camera == null) {
          _camera = Camera.open();
        }
        if (_camera != null) {
          Camera.Parameters params = _camera.getParameters();
          params.setFlashMode(Camera.Parameters.FLASH_MODE_OFF);
          _camera.setParameters(params);
          _camera.stopPreview();
          res = true;
        }
      } catch (Exception e) {
        System.out.println("Failed to get camera : " + e.toString());
      }
      result.success(res);
    } 
    else if (call.method.equals("flashDispose")) {
      try {
        if (_camera != null) {
          _camera.stopPreview();
          _camera.release();
          _camera = null;
        }
      } catch (Exception e) {
        System.out.println("Failed to dispose flash : " + e.toString());
      }
      result.success(true);
    } 
    else {
      result.notImplemented();
    }
  }
}
