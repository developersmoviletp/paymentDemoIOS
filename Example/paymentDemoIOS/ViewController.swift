//
//  ViewController.swift
//  paymentDemoIOS
//
//  Created by Juan Reynaldo Escobar Miron on 03/06/2018.
//  Copyright (c) 2018 Juan Reynaldo Escobar Miron. All rights reserved.
//

import UIKit
import paymentDemoIOS
class ViewController: BaseViewController {

    var mUser : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func lanzador(_ sender: Any) {
        ViewControllerUtils.pushViewController(from: self, to: PayServiceViewController.self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

