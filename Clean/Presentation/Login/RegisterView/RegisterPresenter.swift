//
//  RegisterPresenter.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
protocol RegisterPresenterInput {
    func showLogin()
    func showError(message: String)
}

protocol RegisterPresenterOutput: class {
    func showLogin()
    func showError(message:String)
}

class RegisterPresenter: RegisterPresenterInput{
    
    
    
    var output: RegisterPresenterOutput!
    func showLogin() {
        output.showLogin()
    }
    
    func showError(message: String) {
        self.output.showError(message: message)
    }
}
