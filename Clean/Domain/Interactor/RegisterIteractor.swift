//
//  RegisterIteractor.swift
//  Clean
//
//  Created by Aceleradora Mobile Perú on 18/04/18.
//  Copyright © 2018 Jordan Capa. All rights reserved.
//

import Foundation

class RegisterInteractor{
    
    var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func register(_ user: User, completion: @escaping (_ user: UserEntity?, _ error: ErrorEntity?) -> Void) {
        self.repository.register(user: user){ (user, error) in
            if(user != nil){
                completion(user,error)
            }else if((error?.status)! == 4000){
               completion(user,error)
            }else{
               completion(user,error)
            }
        }
    }
}
