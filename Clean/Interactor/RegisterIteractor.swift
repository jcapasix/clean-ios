//
//  RegisterIteractor.swift
//  Clean
//
//  Created by Aceleradora Mobile Perú on 18/04/18.
//  Copyright © 2018 Jordan Capa. All rights reserved.
//

import Foundation

protocol RegisterInteractorInput {
     func register(_ user: User)
}
protocol RegisterInteractorOutput {
    func showLogin()
    func showError(message: String)
}
class RegisterInteractor: RegisterInteractorInput{
    
    var output: RegisterInteractorOutput!
    var repository = RestApi.sharedInstance
    
    func register(_ user: User) {
        self.repository.register(user: user){ (user, error) in
            if(user != nil){
                self.output.showLogin()
            }else if((error?.status)! == 4000){
                self.output.showError(message: (error?.detail)!)
            }else{
                self.output.showError(message: "Error F")
            }
        }
    }
    /* public init(presenter:LoginInteractorOutput){
     self.output = presenter
     }*/
}
