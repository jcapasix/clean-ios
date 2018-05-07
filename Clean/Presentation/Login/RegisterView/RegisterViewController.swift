//
//  RegisterViewController.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import UIKit


protocol RegisterViewControllerInput {
    func showLogin()
    func showError(message:String)
}

protocol RegisterViewControllerOutput: class {
    func register(_ user: User)
}

class RegisterViewController: UIViewController, RegisterViewControllerInput{
    
    

    var output : RegisterViewControllerOutput!
    var router:RegisterRouter?
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtSamePassword: UITextField!
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    var user: User? = User()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RegisterConfigurator.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRegistrarUsuarioPressed(_ sender: Any) {
        user?.saveUser(username: txtUsername.text!,
                       password: txtPassword.text!,
                       email: txtEmail.text!,
                       first_name: txtFirstName.text!,
                       last_name: txtLastName.text!)
        print(user)
        output.register(self.user!)
    }
    
    func showLogin() {
        router?.routeToHome()
    }
    
    func showError(message: String) {
        lblErrorMessage.text = message
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
