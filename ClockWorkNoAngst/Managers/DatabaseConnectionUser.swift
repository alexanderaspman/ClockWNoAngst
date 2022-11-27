//
//  DatabaseConnectionUser.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-27.
//

import Foundation
import Firebase

class DatabaseConnection: ObservableObject{
    private var dp = Firestore.firestore()
    
    @Published var userLoggedIn = false
    @Published var currentUser: User?
  //  @Published var userDocument: UserDocument?

    init(){
        do {
            try Auth.auth().signOut()
        }
        catch{
            print("hejdå")
        }
        Auth.auth().addStateDidChangeListener{
            auth, user in
            
            if let user = user {
                
                
                self.userLoggedIn = true
                self.currentUser = user
                
            }
            else{
                self.userLoggedIn = false
                self.currentUser = nil
            }
            }
        }
        
        }
    
    
 
