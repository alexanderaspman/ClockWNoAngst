//
//  UserDocument.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-28.
//

import Foundation
import FirebaseFirestoreSwift

struct UserDocument:Codable ,Identifiable {
    @DocumentID var id : String?
    var entries: [JournalEntry]
    }

struct JournalEntry: Codable, Identifiable{
    var id = UUID()
    var title : String
    var description: String
    var date : Date
}

