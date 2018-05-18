//
//  LogoutRouter.swift
//  Clean
//
//  Created by Aceleradora Mobile Perú on 18/05/18.
//  Copyright © 2018 Jordan Capa. All rights reserved.
//

import Foundation
protocol LogoutRouterProtocol {
    func routeToLogin()
}

class LogoutRouter: LogoutRouterProtocol {
    
    private var viewController: LogoutViewController!
    
    init(viewController:LogoutViewController) {
        self.viewController = viewController
    }
    
    func routeToLogin(){
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}

