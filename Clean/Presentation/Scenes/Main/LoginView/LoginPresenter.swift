//
//  LoginPresenter.swift
//  Clean
//
//  Created by jcapasix on 20/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import SVProgressHUD


class LoginPresenter{
 
    private let interactor: LoginInteractor!
    private let viewController: LoginViewControllerProtocol

    init(interactor: LoginInteractor, viewController: LoginViewControllerProtocol){
        self.interactor = interactor
        self.viewController = viewController
    }

    func login(username: String, password: String){        
        SVProgressHUD.show()
        self.interactor.login(username: username, password: password){(user,error) in
            SVProgressHUD.dismiss()
            if (error == nil){
                self.viewController.showHome()
            }
            else{
                self.viewController.showError(message: (error?.detail)!)
            }
        }
    }
    
    func showError(message:String) {
        
    }

}
