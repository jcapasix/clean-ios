//
//  RegisterPresenter.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

class RegisterPresenter{
    
    private var interactor: Interactor!
    private var viewController: RegisterProtocol!

    init(interactor: Interactor, viewController: RegisterProtocol){
        self.interactor = interactor
        self.viewController = viewController
    }
    
}
