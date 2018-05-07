//
//  LoginViewController.swift
//  Clean
//
//  Created by jcapasix on 20/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import UIKit
import IQKeyboardManager


protocol LoginViewControllerInput {
    func showHome()
    func showError(message:String)
}

protocol LoginViewControllerOutput: class {
    func login(username:String, password:String)
}

class LoginViewController: UIViewController, LoginViewControllerInput {
    
    var output: LoginViewControllerOutput!
    var router:LoginRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       IQKeyboardManager.shared().shouldResignOnTouchOutside = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LoginConfigurator.sharedInstance.configure(self)
    }
    
    func showError(message: String) {
        print(message)
    }
    // MARK: - LoginProtocol
    func showHome(){
        self.router?.routeToHome()
    }
    
   
    
//    var presenter:LoginPresenter?
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TapLoginButton(_ sender: Any) {
        //self.presenter?.login(username:self.usernameTextField.text!, password: self.passwordTextField.text!)
        output.login(username: self.usernameTextField.text!, password: self.passwordTextField.text!)
    }

    @IBAction func TapRegisterButton(_ sender: Any) {
        self.router?.routeToRegister()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
