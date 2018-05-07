//
//  LoginInteractor.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

protocol LoginInteractorInput {
    func login(username:String, password:String)
}
protocol LoginInteractorOutput {
    func showHome()
    func showError(message: String)
}
class LoginInteractor: LoginInteractorInput{
    
    var output: LoginInteractorOutput!
    var repository = RestApi.sharedInstance
    
    func login(username: String, password: String) {
        self.repository.login(username: username, password: password) { (user, error) in
            //completion(user, error)
            if(user != nil){
                self.output.showHome()
            }else{
                self.output.showError(message: "incorrecto")
            }
        }
    }
   /* public init(presenter:LoginInteractorOutput){
        self.output = presenter
    }*/
}
