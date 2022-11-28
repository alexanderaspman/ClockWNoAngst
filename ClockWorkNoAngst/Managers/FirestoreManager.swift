//
//  FirestoreManager.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-27.
/*
import Foundation
import Firebase
import FirebaseFirestoreSwift



class FirestoreManager:ObservableObject{
    @Published var titles: String = ""
    @Published var checks: Bool
    @Published var checkered: String = ""

    // init(titles:String,checks:Bool,checkered:String){
        //   fetchNotes()
     
  //  fetchAllNotes()
        
    
    
       func fetchNotes(){
        let db =  Firestore.firestore()
        
        let docRef = db.collection("userTask").document("userTask")
        
        docRef.getDocument{(document,error) in
            guard error == nil else {
                print("print error" , error ?? "")
                return
            }
            if let  document = document, document.exists {
                let data = document.data()
                if let data = data{
                    print("print data", data)
                    self.titles = data["title"] as? String ?? ""
                    self.checks = data["check"] != nil
                    self.checkered = data["checked"] as? String ?? ""

                   
                }
                
            }
            
            
        }
        
    }
                
   
    func fetchAllNotes(){
        let db =  Firestore.firestore()
        
        db.collection("userTask").getDocuments(){ (QuerySnapshot, error) in
          
          
                  
                   if let error = error{
                       print("error getting all documents: \(error)")
                       
                   }
                   else {
                       for document in QuerySnapshot!.documents{
                           print("\(document.documentID): \(document.data())")
                       }
                   }
                    }
       
                }
            
    
    
}
        */
  

