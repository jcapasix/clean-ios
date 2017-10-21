//
//  LoginConfigurator.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

class LoginConfigurator{

    // MARK: Object lifecycle
    public static let sharedInstance = LoginConfigurator()

    // MARK: Configuration
    func configure(_ viewController: LoginViewController){

        let router = LoginRouter(viewController:viewController)

        let repository: Repository = Repository.sharedInstance

        let interactor = Interactor(repository: repository)

        let presenter = LoginPresenter(interactor: interactor, viewController:viewController)

        viewController.router = router
        viewController.presenter = presenter
    }
}
