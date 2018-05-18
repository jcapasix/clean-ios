//
//  LoginViewController.swift
//  Clean
//
//  Created by jcapasix on 20/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import UIKit
import IQKeyboardManager


protocol LoginViewControllerProtocol {
    func showHome()
    func showError(message:String)
}


class LoginViewController: UIViewController, LoginViewControllerProtocol {
    
    var presenter:LoginPresenter?
    var router:LoginRouter?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lbError: UILabel!
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LoginConfigurator.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbError.text = ""
       IQKeyboardManager.shared().shouldResignOnTouchOutside = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - LoginProtocol
    
    func showHome(){
        self.router?.routeToHome()
        self.lbError.text = ""
        self.view.endEditing(true)
    }
    
    func showError(message: String) {
        self.lbError.text = message
        print(message)
    }
    
    //MARK: - Actions
    
    @IBAction func TapLoginButton(_ sender: Any) {
       self.presenter?.login(username: self.usernameTextField.text!, password: self.passwordTextField.text!)
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
