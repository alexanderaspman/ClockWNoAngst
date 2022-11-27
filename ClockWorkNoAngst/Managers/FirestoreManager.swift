//
//  FirestoreManager.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-27.
//
import Foundation
import Firebase



class FirestoreManager:ObservableObject{
    @Published var title: String = ""
   @Published var check: Bool = false
    @Published var checked: String =  ""
    
    func fetchNotes(){
        let db =  Firestore.firestore()
        
        let docRef = db.collection("task").document("MyTask")
        
        docRef.getDocument{(document,error) in
            guard error == nil else {
                print("print error" , error ?? "")
                return
            }
            if let  document = document, document.exists {
                let data = document.data()
                if let data = data{
                    print("print data", data)
                    self.title = data["title"] as? String ?? ""
                   self.check = data["check"] != nil
                    self.checked = data["circle"] as? String ?? ""

                }
                
            }
            
            
        }
        
    }
                
    init(){
        fetchNotes()
        fetchAllNotes()
        }
   
    func fetchAllNotes(){
        let db =  Firestore.firestore()
        
      db.collection("tasks").getDocuments(){ (QuerySnapshot, error) in
          
          
                  
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
        
  

