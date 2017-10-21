//
//  LoginPresenter.swift
//  Clean
//
//  Created by jcapasix on 20/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation


class LoginPresenter{

    private var interactor: LoginInteractor!
    private var viewController: LoginProtocol!

    init(interactor: LoginInteractor, viewController: LoginProtocol){
        self.interactor = interactor
        self.viewController = viewController
    }


}
