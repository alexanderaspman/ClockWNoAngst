//
//  AdDataFirestore.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-27.
//
/*/
import Foundation
import Firebase

class AddTask:ObservableObject{
    @Published var upDateTasks: Array<Any>
    
    
                
   
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
    */
   
