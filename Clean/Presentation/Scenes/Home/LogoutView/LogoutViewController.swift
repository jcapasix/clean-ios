//
//  LogoutViewController.swift
//  Clean
//
//  Created by Aceleradora Mobile Perú on 18/05/18.
//  Copyright © 2018 Jordan Capa. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {

    var router: LogoutRouter?
    
    override func awakeFromNib() {
        LogoutConfigurator.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func btnLogoutPressed(_ sender: Any) {
        self.router?.routeToLogin()
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
