//
//  TaskEdit.swift
//  Doit_test_sergemi
//
//  Created by sergemi on 2/28/19.
//  Copyright © 2019 sergemi. All rights reserved.
//

import UIKit

class TaskEditVC : UIViewController {
    
    @IBOutlet weak var titleTView: UITextView!
    
    var isNew: Bool = false
    
    convenience init(id: Int) {
        self.init()
        
        isNew = id == -1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = isNew ? "New task" : "Edit task"

        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleTView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        titleTView.layer.borderWidth = 0.5
    }
    
}
