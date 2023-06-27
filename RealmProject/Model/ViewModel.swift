//
//  ViewModel.swift
//  RealmProject
//
//  Created by Вероника Гера on 27.06.2023.
//

import Foundation
import RealmSwift
import ObjectiveC

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks : [Item] = []

    init() {
        openRealm()
        getTask()
    }
    
    func openRealm() {
        
        let _ = print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        do{
            let config = Realm.Configuration(schemaVersion : 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        
        if let localRealm = localRealm {
            do{
                try localRealm.write {
                    let newTask = Item(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    
                    getTask()
                    print("New task - \(taskTitle) added to Realm ")
                }
            } catch {
                print("Error adding task to Realm \(error)")
            }
        }
        
    }
    
    func getTask() {
        if let localrealm = localRealm {
           let allTask = localrealm.objects(Item.self).sorted(byKeyPath: "completed")
            tasks = []
            allTask.forEach { task in
                tasks.append(task)
            }
        }
        
    }
    
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localrealm = localRealm {
            do {
                let taskToUpdate = localrealm.objects(Item.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToUpdate.isEmpty else { return }
                
                try localrealm.write {
                    taskToUpdate[0].completed = completed
                    getTask()
                    print("task updating")
                }
            } catch {
                print("Error updating task \(id) to Realm \(error)")
            }
        }
    }
    
    func deletTask(id: ObjectId) {
        if let localrealm = localRealm {
            do {
                let taskToDelete = localrealm.objects(Item.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToDelete.isEmpty else { return }
                
                try localrealm.write {
                    localrealm.delete(taskToDelete)
                    getTask()
                }
            } catch {
                print("Error deleting task with id \(id) to Realm \(error)")
            }
            
        }
        
    }
    
}
