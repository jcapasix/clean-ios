//
//  Repository.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

//typealias LoginHandler = (_ msg: String?) -> Void;

//struct LoginErrorCode {
//    static let WRONG_PASSWORD = "Wrong Password, Please Enter The Correct Password"
//    static let INVALID_EMAIL = "Invalid Email Addres, Please Provide a Real Email Address"
//    static let USER_NOT_FOUND = "User Not Found, Please Register"
//    static let EMAIL_ALREADY_IN_USE = "Email Already In Use, Please Use Another Email"
//    static let WEAK_PASSWORD = "Password Should Be At Least 6 Characters Long"
//    static let PROBLEM_CONNECTING = "Problem Connecting To Database, Please Try Later"
//}

class Repository{
    public static let sharedInstance = Repository()

    func logIn(email:String, password:String, completion:@escaping (_ rpt:Bool) -> Void){
//        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//            if error != nil {
//                completion(false)
//                print(error.debugDescription)
//            }
//            else{
//                completion(true)
//            }
//        }
    }

}
