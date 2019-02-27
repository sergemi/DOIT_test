//
//  ViewController.swift
//  Doit_test_sergemi
//
//  Created by sergemi on 2/27/19.
//  Copyright © 2019 sergemi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserAuth.inst.isLogged() {
            print("logged")
            
            let myViewController = TasksListVC(nibName: "TasksListVC", bundle: nil)
            self.present(myViewController, animated: false, completion: nil)
        }
        else {
            print("Need login")
            
            UserAuth.inst.showLoginScreen()
        }
        
//        let myViewController = LoginVC(nibName: "LoginVC", bundle: nil)
//        self.present(myViewController, animated: false, completion: nil)
    }


}

