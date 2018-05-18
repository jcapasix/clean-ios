//
//  ApiREST.swift
//  Clean
//
//  Created by jcapasix on 21/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import ReachabilitySwift

public class RestApi: Repository{

    public static let sharedInstance = RestApi()
    
    var alamofireManager : Alamofire.SessionManager?
    //var alamofireManagerAuth : Alamofire.SessionManager?
    
    let reachability = Reachability()
    //var requestAlamo:Alamofire.DataRequest?
    
    let upsError:ErrorEntity = ErrorEntity(status: 999, title: "¡Ups!", detail: "Ocurrió un problema al conectarse con el servidor, por favor intenta nuevamente.", type:AlertType.errorAlert)
    
    let redError:ErrorEntity = ErrorEntity(status: 999, title: "", detail: "Tu conecxión a internet esta fallando, por favor intenta de nuevo.", type:AlertType.errorRed)
    
    typealias VerifyResponse = (_ succeeded: Bool)->Void
    
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]

    private init() {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 4
        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
        //self.alamofireManagerAuth = Alamofire.SessionManager(configuration: configuration)
        //self.managmentAuth()
    }
    
    public func login(username:String,
                      password:String,
                      completion:@escaping (_ user:UserEntity?, _ error:ErrorEntity?) -> Void){

        var user:UserEntity?
        var error:ErrorEntity?

        if(self.isThereNetworkConnection()){

            let parameters : [ String : Any] = [
                "username" : username,
                "password" : password
            ]

            let url = ApiURL.URL_LOGIN

            print(url)

            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<UserEntityResponse>) in

                switch response.result {
                case .success:
                    let data = response.result.value
                    if(response.response?.statusCode == 200){
                        user = data?.user
                        error = data?.error

                        User.sharedInstance.saveUser(username: (user?.username)!,
                                                     password: password,
                                                     email: (user?.email)!,
                                                     first_name: (user?.first_name)!,
                                                     last_name: (user?.last_name)!
                                                )
                        completion(user, error)
                    }
                    if(response.response?.statusCode == 400){
                        error = data?.error
                        completion(user, error)
                    }
                case .failure( _):
                    completion(user, self.upsError)
                }
            }

        }else{
            completion(user, self.redError)
        }
    }
    
    func register(user: User, completion: @escaping (UserEntity?, ErrorEntity?) -> Void) {
        
        var userEntity: UserEntity?
        var error: ErrorEntity?
        
        if(self.isThereNetworkConnection()){
            
            let parameters : [ String : Any] = user.convertUserEntity().toJSON()
            print(parameters)
            let url = ApiURL.URL_REGISTER
            
            print(url)
            
           self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<UserEntity>) in
                print(response)
                switch response.result {
                case .success:
                    let data = response.result.value
                    if(response.response?.statusCode == 201){
                        userEntity = data
                        
                        completion(userEntity, error)
                    }
                    if(response.response?.statusCode == 400){
                        error = (data?.error)!
                        completion(userEntity, error)
                    }
                case .failure( _):
                    completion(userEntity, self.upsError)
                }
            }
            
        }else{
            completion(userEntity, self.redError)
        }
    }
    
    public func isThereNetworkConnection()->Bool{
        var isConnected:Bool
        isConnected = (self.reachability?.isReachable)!
        return isConnected
    }

}
