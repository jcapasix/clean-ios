//
//  ApiProtocol.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

protocol ApiProtocol {

    func login(username:String, password:String, completion:@escaping (_ user:UserEntity?, _ error:ErrorEntity?) -> Void)
}
