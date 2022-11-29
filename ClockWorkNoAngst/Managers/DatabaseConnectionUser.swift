
import Foundation
import Firebase

class DatabaseConnection: ObservableObject {
    
    private var db = Firestore.firestore()
    
    @Published var userLoggedIn = false
    @Published var currentUser: User?
    @Published var userDocument: UserDocument?
    
    var userDocumentListener: ListenerRegistration?
    
    init() {
        
        do {
        try Auth.auth().signOut()
        } catch {
            print("hej")
        }
        
        Auth.auth().addStateDidChangeListener {
            auth, user in
            
            if let user = user {
                // Vi är inloggade
                
                self.userLoggedIn = true
                self.currentUser = user
                self.listenToDb()

            } else {
                // Vi är utloggade
                self.userLoggedIn = false
                self.currentUser = nil
                self.stopListeningToDb()
            }
            
        }
        
        
    }
    
    func stopListeningToDb() {
        if let userDocumentListener = userDocumentListener {
            userDocumentListener.remove()
        }
    }
    
    func listenToDb() {
        
        if let currentUser = currentUser {
            
            userDocumentListener = self.db.collection("userData").document(currentUser.uid).addSnapshotListener {
                snapshot, error in
                
                if let error = error {
                    print("Error occurred \(error)")
                    return
                }
                
                guard let snapshot = snapshot else {
                    return
                }

                let result = Result {
                    try snapshot.data(as: UserDocument.self)
                }
                
                switch result {
                case .success(let userData):
                    self.userDocument = userData
                    break
                case .failure(let error):
                    print("Something went wrong retrieving data: \(error)")
                    break
                }
                
                
                
            }
            
            
            
            
        }
        
        
    }
    
    // db.collection("userData").document(currentUser.uid) <---> Väljer det dokument i våran collection, som har samma namn som våran användare's id.
    
    // updateData <---> Vi vill uppdatera värdet av ett fält, och vi skriver en dictionary, där vi anger vilket fältnamn samt det nya värdet för fältet
    
    // I det här fallet vill vi inte ge den ett helt nytt värde, utan vi vill lägga till (appenda) ett element, till våran array
    
    // I det nya värdet, skriver vi FieldValue.arrayUnion för att tydliggöra att vi vill lägga på och inte ersätta arrayen. Då har vi en array [] där vi lägger in alla nya element som vi vill lägga in.
    
    // I vårat fall har vi en custom object (JournalEntry), och därför måste vi använda oss utav Firestore.Encoder().encode som kan avläsa våran custom object till data som kan lagras i Firebase.
    
    
    
    
    
    func LoginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authDataResult, error in
            
            if let error = error {
                print("Error logging in: \(error)")
            }
            
        }
    }
    
    func RegisterUser(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) {
            
            authDataResult, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let authDataResult = authDataResult {
                
                let newUserDocument = UserDocument(id: authDataResult.user.uid, entries: [])
                
                do {
                    
                try self.db.collection("userData").document(authDataResult.user.uid).setData(from: newUserDocument)
                    
                } catch {
                    print("error")
                }
                
                
            }
            
            
        }
        
    }
    
}
