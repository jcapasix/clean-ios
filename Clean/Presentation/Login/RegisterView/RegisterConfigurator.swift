//
//  RegisterConfigurator.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
extension RegisterViewController: RegisterPresenterOutput {
   
}

extension RegisterInteractor: RegisterViewControllerOutput {
}

extension  RegisterPresenter: RegisterInteractorOutput {
    
}

class RegisterConfigurator{

    // MARK: Object lifecycle
    public static let sharedInstance = RegisterConfigurator()

    // MARK: Configuration
    func configure(_ viewController: RegisterViewController){

        let router = RegisterRouter(viewController:viewController)
        let presenter = RegisterPresenter()
        presenter.output = viewController
        let interactor = RegisterInteractor()
        interactor.output = presenter
        viewController.router = router
        viewController.output = interactor
    }
 
}
