//
//  LoginConfigurator.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import UIKit


class LoginConfigurator{

    // MARK: Object lifecycle
    public static let sharedInstance = LoginConfigurator()

    // MARK: Configuration
    func configure(_ viewController: LoginViewController){

        let router = LoginRouter(viewController:viewController)
        
        let interactor = LoginInteractor(repository: RestApi.sharedInstance)
        
        let presenter = LoginPresenter(interactor: interactor, viewController: viewController)
        
        viewController.router = router
        viewController.presenter = presenter
    }
}
