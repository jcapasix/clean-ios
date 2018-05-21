//
//  LogoutConfigurator.swift
//  Clean
//
//  Created by Aceleradora Mobile Perú on 18/05/18.
//  Copyright © 2018 Jordan Capa. All rights reserved.
//

import Foundation

class LogoutConfigurator{
    
    // MARK: Object lifecycle
    public static let sharedInstance = LogoutConfigurator()
    
    // MARK: Configuration
    func configure(_ viewController: LogoutViewController){
        
        let router = LogoutRouter(viewController:viewController)
        
        viewController.router = router
    }
}
