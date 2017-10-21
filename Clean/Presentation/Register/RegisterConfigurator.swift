//
//  RegisterConfigurator.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

class RegisterConfigurator{

    // MARK: Object lifecycle
    public static let sharedInstance = RegisterConfigurator()

    // MARK: Configuration
    func configure(_ viewController: RegisterViewController){

        let router = RegisterRouter(viewController:viewController)

        let repository: Repository = LoginRepository.sharedInstance

        let interactor = Interactor(repository: repository)

        let presenter = RegisterPresenter(interactor: interactor, viewController:viewController)

        viewController.router = router
        viewController.presenter = presenter
    }
    
}
