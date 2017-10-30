//
//  Configuration.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//
import Foundation

public let AppEnvironment = Environment.Production

public protocol Configuration {
    /// URL of the REST server
    static var serverURL: String { get }
}

public struct ProductionConfig: Configuration {

    public static let serverURL = "https://cleanws.herokuapp.com/api"
}

public struct DevelopConfig: Configuration {

    public static let serverURL = "http://192.168.8.102:8000/api"
}

public struct TestConfig: Configuration {

    public static let serverURL = "http://192.168.8.102:8000/api"
}

public extension Environment {

    var configuration: Configuration.Type {
        switch self {
        case .Development: return DevelopConfig.self
        case .Production: return ProductionConfig.self
        case .Test: return TestConfig.self
        }
    }
}
