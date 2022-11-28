//
//  Task.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-28.
//

import Foundation
import RealmSwift
class Task:Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
