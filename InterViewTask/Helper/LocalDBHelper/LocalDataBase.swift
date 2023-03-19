//
//  LocalDataBase.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import Foundation
import CoreData
import UIKit

class LocalDataBase {
    
    static let shared = LocalDataBase()
    
    var appName = Bundle.main.infoDictionary?["CFBundleName"] as? String

    var userData = [UserData]()

    func fetchUserDetails() {
        let fetchRequest: NSFetchRequest<User_Data> = User_Data.fetchRequest()
        do {
            let users = try self.persistentContainer.viewContext.fetch(fetchRequest)

            self.userData.removeAll()
            for user in users {
                self.userData.append(UserData(user))
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    
    func storeUserDetails(_ userDetails: [[String: String]], currentUser: User_Data?) {
        var user = currentUser ?? User_Data(context: self.persistentContainer.viewContext)
        
        print(userDetails)
        
        userDetails.forEach() {
            user.user_Name = $0["Name"]
            user.user_Email = $0["Email"]
            user.user_phone = $0["Mobile"]
            user.user_Gender = $0["Gender"]
            user.user_Id = $0["Id"]
        }
        do {
            try context.save()
            print("saved!")
            self.fetchUserDetails()
        }
        catch let error {
            print("Could not save \(error), \(error.localizedDescription)")
        }
        
    }
    func delete(index: String? = "") {
        let manageContxt = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User_Data")
        guard let valueindex = index else { return }
        let predicate =  NSPredicate(format: "user_Id == \(valueindex)")
//        print("index",valueindex)
        fetchRequest.predicate = predicate
        do{
            let result = try manageContxt.fetch(fetchRequest)
            print(result.count)
            if result.count > 0{
                for object in result {
//                    print("Deleted Objc",object)
                    manageContxt.delete(object as! NSManagedObject)
                }
            }
        }catch let error{
            print("ERROR  : \(error)")
        }
    }
    
    func updateUserDetails(_ userDetails: [[String:String]],index: String? = "") {
        do {
            guard let id = index else { return }
            self.delete(index: "\(id)")
            self.storeUserDetails(userDetails, currentUser: nil)
        } catch let error {
            print("ERROR  : \(error)")
        }
    }
    func deleteUserDetails() {
        do {
            let fetchRequest: NSFetchRequest<User_Data> = User_Data.fetchRequest()
            do {
                let objects  = try context.fetch(fetchRequest)
                _ = objects.map{ context.delete($0) }
                try context.save()
                self.userData.removeAll()
                print("Deleted!")
            }
            catch let error {
                print("ERROR DELETING : \(error)")
            }
        }
    }

    // MARK: - Core Data Saving support
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "InterViewTask")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
