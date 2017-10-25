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

public class ApiREST: ApiRestProtocol{

    public static let sharedInstance = ApiREST()

    var alamofireManager : Alamofire.SessionManager?
    //var alamofireManagerAuth : Alamofire.SessionManager?

    let reachability = Reachability()
    //var requestAlamo:Alamofire.DataRequest?
    typealias VerifyResponse = (_ succeeded: Bool)->Void

    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]

    private init() {

        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 10
        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
        //self.alamofireManagerAuth = Alamofire.SessionManager(configuration: configuration)
        //self.managmentAuth()
    }

    public func login(username:String,
                      password:String,
                      completion:@escaping (_ user:UserEntity?, _ error:ErrorEntity?) -> Void){

        if(self.isThereNetworkConnection()){

            let parameters : [ String : Any] = [
                "username" : username,
                "password" : password
            ]

            let url = ApiURL.URL_LOGIN

            print(url)

            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<UserEntityResponse>) in

                var user:UserEntity?
                var error:ErrorEntity?

                switch response.result {
                case .success:
                    let data = response.result.value
                    if(response.response?.statusCode == 200){
                        user = data?.user

                        User.sharedInstance.saveUser(username: (user?.username)!,
                                                     email: (user?.email)!,
                                                     first_name: (user?.first_name)!,
                                                     last_name: (user?.last_name)!,
                                                     token: (user?.token)!)
                        completion(user, error)
                    }
                    if(response.response?.statusCode == 400){
                        error = data?.error
                        completion(user, error)
                    }

                case .failure(let error):
                    print(error)
                }
            }

        }else{
            print("Error de red")
        }
    }

    public func isThereNetworkConnection()->Bool{
        var isConnected:Bool
        isConnected = (self.reachability?.isReachable)!
        return isConnected
    }

}
