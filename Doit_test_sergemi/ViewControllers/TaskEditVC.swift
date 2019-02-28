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
    
    @IBOutlet weak var priorityLbl: UILabel!
    @IBOutlet weak var priorityHighBtn: UIButton!
    @IBOutlet weak var priorityMediumBtn: UIButton!
    @IBOutlet weak var priorityLowBtn: UIButton!
    
    var isNew: Bool = false
    var priority: String = ""
    
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
        
        func addRect(control: UIView) {
            control.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
            control.layer.borderWidth = 0.5
        }
        
        addRect(control: titleTView)
        addRect(control: priorityHighBtn)
        addRect(control: priorityMediumBtn)
        addRect(control: priorityLowBtn)
    }
    
    func updatePriorLbl() {
        if priority == "" {
            priorityLbl.text = "Priority"
        }
        else {
            priorityLbl.text = "Priority: " + priority
        }
    }
    
    @IBAction func onPriorityHigh(_ sender: Any) {
        priority = "High"
        updatePriorLbl()
    }
    
    @IBAction func onPriorityMedium(_ sender: Any) {
        priority = "Medium"
        updatePriorLbl()
    }
    
    @IBAction func onPriorityLow(_ sender: Any) {
        priority = "Low"
        updatePriorLbl()
    }
    
    
}
