//
//  LoginInteractor.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

class LoginInteractor{

    var repository : Any

    public init(repository:Any){
        self.repository = repository
    }

    func login(email:String, password:String, completion:@escaping (_ rpt:Bool) -> Void){
        (repository as! LoginRepository).logIn(email: email, password: password) { (rpt) in
            if rpt{
                completion(true)
            }
            else{
                completion(false)
            }
        }
    }


}
