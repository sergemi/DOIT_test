//
//  NetMgr.swift
//  Doit_test_sergemi
//
//  Created by sergemi on 2/28/19.
//  Copyright © 2019 sergemi. All rights reserved.
//

import UIKit
import Alamofire

class NetMgr:NSObject {
    
    static let inst = NetMgr()
    
    let baseURL = "http://testapi.doitserver.in.ua/api"
    
    private override init() {
    }
    
    func registerUser(email: String, password: String, onSuccess success: @escaping () -> Void) {
//        print("registerUser(email:'\(email)', password:'\(password)')")
        
        let url = baseURL + "/users"
        
        let params = [
            "email": email,
            "password": password
        ]
        
        request(url, method: .post, parameters: params).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let jsonArray = value as? [String: Any] else { return }
                if let tokenText = jsonArray["token"] as? String {
                    UserAuth.inst.setToken(token: tokenText)
                    UserAuth.inst.showTasksListScreen()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func loginUser(email: String, password: String, onSuccess success: @escaping () -> Void) {
//        print("loginUser(email:'\(email)', password:'\(password)')")
        
        let url = baseURL + "/auth"
        
        let params = [
            "email": email,
            "password": password
        ]
        
        request(url, method: .post, parameters: params).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let jsonArray = value as? [String: Any] else { return }
                if let tokenText = jsonArray["token"] as? String {
                    UserAuth.inst.setToken(token: tokenText)
                    UserAuth.inst.showTasksListScreen()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
