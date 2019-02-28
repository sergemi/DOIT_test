//
//  TasksListVC.swift
//  Doit_test_sergemi
//
//  Created by sergemi on 2/27/19.
//  Copyright © 2019 sergemi. All rights reserved.
//

import UIKit

class TasksListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My tasks"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        plusBtn.layer.cornerRadius = 20
    }
    
    
    @IBAction func onPlusBtn(_ sender: Any) {
        let vc = TaskEditVC(id: -1)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
