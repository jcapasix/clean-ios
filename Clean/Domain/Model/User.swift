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
    var email:String?
    var first_name:String?
    var last_name:String?
    var token:String?

    private init() {}

    func saveUser(username:String,
                  email:String,
                  first_name:String,
                  last_name:String?,
                  token:String?){

        self.username = username
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.token = token
    }

    func getFullName() -> String{
        return "\(self.first_name!) \(self.last_name!)"
    }

    func destroy(){
        self.username = nil
        self.email = nil
        self.first_name = nil
        self.last_name = nil
        self.token = nil
    }
}
