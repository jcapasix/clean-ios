//
//  UserEntity.swift
//  Clean
//
//  Created by Jordan Capa on 10/29/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper

public class UserEntityResponse: Mappable  {
    
    var user:UserEntity?
    var error: ErrorEntity?
    
    required public init?(map: Map) {
    }
    
    init(){
        
    }
    
    public func mapping(map: Map) {
        self.user <- map["user"]
        self.error <- map["error"]
    }
}

public class UserEntity: Mappable  {
    
    var username:String?
    var email:String?
    var first_name:String?
    var last_name:String?
    var error: ErrorEntity?
    var password:String?
    
    required public init?(map: Map) {
    }
    
    init(){
        
    }
    
    public func mapping(map: Map) {
        self.password <- map["password"]
        self.username           <- map["username"]
        self.email              <- map["email"]
        self.first_name         <- map["first_name"]
        self.last_name          <- map["last_name"]
    }
}
