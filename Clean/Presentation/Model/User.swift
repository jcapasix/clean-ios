//
//  User.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

class User{

    private static let _sharedInstance = User()

    static var sharedInstance: User{
        return _sharedInstance
    }

    var username:String?
    var password:String?
    var email:String?
    var first_name:String?
    var last_name:String?
    var token:String?

    init() {}

    func saveUser(username:String,
                  password:String,
                  email:String,
                  first_name:String,
                  last_name:String){

        self.username = username
        self.password = password
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
    }
    
    func convertUserEntity() -> UserEntity {
        let userEntity = UserEntity()
        
        userEntity.username = self.username
        userEntity.first_name = self.first_name
        userEntity.last_name = self.last_name
        userEntity.email = self.email
        userEntity.password = self.password
        
        
        return userEntity
    }

    func getFullName() -> String{
        return "\(self.first_name!) \(self.last_name!)"
    }

    func destroy(){
        self.username = nil
        self.password = nil
        self.email = nil
        self.first_name = nil
        self.last_name = nil
        self.token = nil
    }
}
