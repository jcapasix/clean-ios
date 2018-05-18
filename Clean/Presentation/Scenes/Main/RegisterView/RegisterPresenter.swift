//
//  RegisterPresenter.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

class RegisterPresenter{
    
    let interactor: RegisterInteractor!
    let viewController: RegisterViewControllerProtocol
    
    init(interactor: RegisterInteractor, viewController: RegisterViewControllerProtocol) {
        self.interactor = interactor
        self.viewController = viewController
    }
    
    func register(user: User) {
        self.interactor.register(user) { (user,error) in
            if user != nil {
                self.viewController.showLogin()
            } else {
                self.viewController.showError(message: (error?.detail)!)
            }
            
        }
    }
    
    func showError(message: String) {
       
    }
}
