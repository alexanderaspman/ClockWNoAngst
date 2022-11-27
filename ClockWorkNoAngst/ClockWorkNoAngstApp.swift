import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestoreSwift


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ClockWorkNoAngst: App {
    @StateObject var firestoreManager = FirestoreManager()
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
          ContentView(email: "", password: "", showLogin: .constant(false), text: "", startAnimation: false, showCreateAccount: false,  isSuccessfull: false).environmentObject(firestoreManager)
      }
    }
  }
}
