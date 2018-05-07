//
//  LoginRouter.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterProtocol {
    //func navigateToSomewhere()
    func routeToHome()
    func routeToRegister()
}

class LoginRouter: LoginRouterProtocol {

    //LoginViewController (example)
    private var viewController: LoginViewController!

    init(viewController:LoginViewController) {
        self.viewController = viewController
    }
    // MARK: Navigation

//    func navigateToSomewhere() {
//        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
//
//        // 1. Trigger a storyboard segue
//        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
//
//        // 2. Present another view controller programmatically
//        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
//
//        // 3. Ask the navigation controller to push another view controller onto the stack
//        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
//
//        // 4. Present a view controller from a different storyboard
//        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
//        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
//        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
//    }

    func routeToHome(){
        viewController.performSegue(withIdentifier: "showHome", sender: nil)
    }

    func routeToRegister(){
        viewController.performSegue(withIdentifier: "showRegister", sender: nil)
    }

//    // MARK: Communication
//
//    func passDataToNextScene(_ segue: UIStoryboardSegue) {
//        // NOTE: Teach the router which scenes it can communicate with
//
//        if segue.identifier == "ShowSomewhereScene" {
//            passDataToSomewhereScene(segue)
//        }
//    }
//
//    fileprivate func passDataToSomewhereScene(_ segue: UIStoryboardSegue) {
//        // NOTE: Teach the router how to pass data to the next scene
//
//        // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
//        // someWhereViewController.output.name = viewController.output.name
//    }
    
    

}
