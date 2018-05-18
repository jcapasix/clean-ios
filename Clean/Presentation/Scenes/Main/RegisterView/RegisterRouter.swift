//
//  RegisterRouter.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterRouterProtocol {
}

class RegisterRouter: RegisterRouterProtocol {

    //LoginViewController (example)
    private var viewController: RegisterViewController!

    init(viewController:RegisterViewController) {
        self.viewController = viewController
    }

    func routeToHome(){
        viewController.navigationController?.popViewController(animated: true)
    }

}
