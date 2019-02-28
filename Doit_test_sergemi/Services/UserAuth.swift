//
//  UserAuth.swift
//  Doit_test_sergemi
//
//  Created by sergemi on 2/27/19.
//  Copyright © 2019 sergemi. All rights reserved.
//

//import Foundation
import UIKit

class UserAuth:NSObject {
    
    static let inst = UserAuth()
    
    private override init() {
    }
    
    static let tokenKeyName = "UserToken"
    
    func showLoginScreen() {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            let myViewController = LoginVC(nibName: "LoginVC", bundle: nil)
            topController.present(myViewController, animated: false, completion: nil)
            
            
        }
    }
    
    func showTasksListScreen() {
        let myViewController = TasksListVC(nibName: "TasksListVC", bundle: nil)
        let navController = UINavigationController(rootViewController: myViewController)
        
        let window = UIApplication.shared.keyWindow
        
        window?.makeKeyAndVisible()
        window?.rootViewController = navController        
    }
    
    func isLogged() -> Bool {
//        return false
//        return true
        
        return UserDefaults.standard.object(forKey: UserAuth.tokenKeyName) != nil
    }
    
    func setToken(token: String) {
        UserDefaults.standard.set(token, forKey: UserAuth.tokenKeyName)
    }
    
}
