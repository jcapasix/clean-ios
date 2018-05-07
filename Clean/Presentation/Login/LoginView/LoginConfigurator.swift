//
//  LoginConfigurator.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import UIKit

extension LoginViewController: LoginPresenterOutput {
}

extension LoginInteractor: LoginViewControllerOutput {
}

extension LoginPresenter: LoginInteractorOutput {
}

class LoginConfigurator{

    // MARK: Object lifecycle
    public static let sharedInstance = LoginConfigurator()

    // MARK: Configuration
    func configure(_ viewController: LoginViewController){

        let router = LoginRouter(viewController:viewController)
        //let repository: Repository = RestApi.sharedInstance
        let presenter = LoginPresenter()
        presenter.output = viewController
        let interactor = LoginInteractor()
        interactor.output = presenter
        viewController.router = router
        viewController.output = interactor
    }
}
