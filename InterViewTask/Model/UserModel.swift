//
//  UserModel.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import Foundation
import CoreData

struct UserData {
    
    var name: String?
    var email: String?
    var mobile: String?
    var gender: String?
    var id: String?
    
    init(_ userDetails: User_Data) {
        
        self.name = userDetails.value(forKey: "user_Name") as? String
        self.email = userDetails.value(forKey: "user_Email") as? String
        self.mobile = userDetails.value(forKey: "user_phone") as? String
        self.gender = userDetails.value(forKey: "user_Gender") as? String
        self.id = userDetails.value(forKey: "user_Id") as? String


    }
}
