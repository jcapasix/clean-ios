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
    func routeToHome()
}

class RegisterRouter: RegisterRouterProtocol {

    //LoginViewController (example)
    private var viewController: LoginViewController!

    init(viewController:LoginViewController) {
        self.viewController = viewController
    }


    func routeToHome(){
        viewController.performSegue(withIdentifier: "showHome", sender: nil)
    }

}
