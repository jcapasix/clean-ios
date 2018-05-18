//
//  LoginInteractor.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

class LoginInteractor {
    
    var repository : Repository
    
    init( repository : Repository) {
        self.repository = repository
    }
    
    func login(username: String, password: String, completion:@escaping (_ user:UserEntity?, _ error:ErrorEntity?) -> Void){
        self.repository.login(username: username, password: password) { (user,error) in
            if(user != nil){
               completion(user,error)
            } else {
                completion(user,error)
            }
        }
    }
    
}
