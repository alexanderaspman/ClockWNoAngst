//
//  Item.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-27.
//

import SwiftUI
import Foundation
import FirebaseFirestoreSwift
 struct ItemData:Codable,Identifiable{
    
    @DocumentID var id : String? 
    var title: String
    var check :Bool 
    
    var checked : String = "circle"
   //  {
  // didSet{
        // checked(check ? "circle" : "checkmark.circle")
   
    enum CodingKeys:String,CodingKey{
        case title
        case checked
        case check = "checkmark.circle"
        
        
    }
 
       
    }
    
    
    

