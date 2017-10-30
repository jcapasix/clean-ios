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

    private var interactor: Interactor!
    private var viewController: LoginProtocol!

    init(interactor: Interactor, viewController: LoginProtocol){
        self.interactor = interactor
        self.viewController = viewController
    }

    func login(username:String, password:String){
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient)
        SVProgressHUD.show()
        self.interactor.login(username: username, password: password) { (user, error) in
            SVProgressHUD.dismiss()
            if (error == nil){
                self.viewController.showHome()
            }
            else{
                self.viewController.showEror(message: "Error")
            }
        }
    }

}
