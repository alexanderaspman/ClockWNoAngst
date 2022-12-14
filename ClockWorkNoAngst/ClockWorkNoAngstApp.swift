import SwiftUI
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
    @StateObject var realmManager = RealmManager()
    
    
  //register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
          ContentView(dbConnection: DatabaseConnection()).environmentObject(realmManager)
          
          //ContentView(firestoreManager: Firestore(), email: "", createEmail: "", password: "", createPassword: "", showLogin: .constant(false), text: "", showCreateAccount: false)
      }
    }
  }
}
