//
//  ErrorEntity.swift
//  Clean
//
//  Created by Jordan Capa on 10/29/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

//
//  Error.swift
//  Westeros
//
//  Created by jcapasix on 9/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper


public class ErrorResponse: Mappable  {
    
    var error:ErrorEntity?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.error <- map["error"]
    }
}

public class ErrorEntity: Mappable  {
    
    var status:Int?
    var title:String?
    var detail:String?
    var type:AlertType?
    
    init(status:Int?, title:String?, detail:String?, type:AlertType?) {
        self.status = status
        self.title = title
        self.detail = detail
        self.type = type
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.status <- map["status"]
        self.title  <- map["title"]
        self.detail <- map["detail"]
        self.detail <- map["type"]
    }
}

