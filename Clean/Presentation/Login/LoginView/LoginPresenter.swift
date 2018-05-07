//
//  LoginPresenter.swift
//  Clean
//
//  Created by jcapasix on 20/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol LoginPresenterInput {
    func showHome()
    func showError(message:String)
}

protocol LoginPresenterOutput: class {
    func showHome()
    func showError(message:String)
}
class LoginPresenter: LoginPresenterInput{
 

    var output: LoginPresenterOutput!
    //private var viewController: LoginProtocol!

    /*init(viewController: LoginPresenterOutput){
        self.output = viewController
    }*/

    func showHome(){
        output.showHome()
    }
    
    func showError(message:String) {
        self.output.showError(message: message)
    }

}
