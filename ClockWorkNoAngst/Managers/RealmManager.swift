//
//  RealmManager.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-28.
//

import Foundation
import RealmSwift

class RealmManager:ObservableObject{
    private(set) var localRealm: Realm?
    @Published private(set) var tasks:[Task] = []
    init(){
        openRealm()
        getTask()
        
    }
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        }
        catch{
            print("error opening realm\(error)")
        }
    }
    func addTask(taskTitle:String){
        if let localRealm = localRealm{
            do{
                try localRealm.write{
                    let newTask = Task(value: ["title": taskTitle,"completed": false])
                    localRealm.add(newTask)
                    getTask()
                    print("addad new task \(newTask)")
                }
            }
            catch{
                print("error adding task")
            }
        }
    }
    func getTask(){
        if let localRealm = localRealm{
  let allTasks =          localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach{task in
                tasks.append(task)
            }
        }
    }
    func uppdateTask(id:ObjectId, completed:Bool){
        if let localRealm = localRealm{
            do{
            let taskToUpdate =    localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                try localRealm.write{
                    taskToUpdate[0].completed = completed
                   getTask()
                    print("error in uppdate")
                }
            } catch{
                print("error uppdating task \(id) to realm")
            }
        }
    }
    func deleteTask(id:ObjectId){
        if let localRealm = localRealm{
            do{
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else  {return}
                
                try localRealm.write{ localRealm.delete(taskToDelete)
                    getTask()
                    print("deleted task with id \(id)")
                }
            }
            catch{
                print("error in deleting ttask \(id)")
            }
        }
    }
}
