import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      GMSServices.provideAPIKey("AIzaSyDA2kvPvlJHa_lzO0Dm1rhFOIMInHhze4I")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
