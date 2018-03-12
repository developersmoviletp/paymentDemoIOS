//
//  ViewController.swift
//  paymentDemoIOS
//
//  Created by Juan Reynaldo Escobar Miron on 03/06/2018.
//  Copyright (c) 2018 Juan Reynaldo Escobar Miron. All rights reserved.
//

import UIKit
import paymentDemoIOS
class ViewController: UIViewController {

    var mDataManager : DataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user : User = User(accountNumber: "0101490064");
        mDataManager.tx(execute: { (transactions) -> Void in
            transactions.mRealm.deleteAll()
            transactions.save(object: user)
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func lanzador(_ sender: Any) {
        let matches = Bundle.allFrameworks.filter { (aBundle) -> Bool in
            guard let identifier = aBundle.bundleIdentifier else { return false }
            return identifier.contains("paymentDemoIOS") && aBundle.isLoaded
        }
        if !matches.isEmpty {
            let storyboard = UIStoryboard(name: "Views", bundle: matches.last!)
            let viewController = storyboard.instantiateInitialViewController()
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        ViewControllerUtils.pushViewController(from: self, to: PayServiceViewController.self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

