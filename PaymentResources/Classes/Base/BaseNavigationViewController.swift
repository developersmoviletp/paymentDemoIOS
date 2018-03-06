//
//  BaseNavigationViewController.swift
//  VentasTotalPlayiOS
//
//  Created by Jorge Hdez Villa on 01/03/17.
//  Copyright © 2017 TotalPlay. All rights reserved.
//

import UIKit

public class BaseNavigationViewController: UINavigationController {
    
    var resultDelegate : ControllerResultDelegate?
    var requestValue : String = ""
    var extras : [String: AnyObject] = [:]
    var resultValue : ViewControllerResult = ViewControllerResult.RESULT_ERROR
    var data : [String : AnyObject] = [:]
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        if resultDelegate != nil {
            resultDelegate?.viewControllerForResult(keyRequest: requestValue, result: resultValue, data: data)
        }
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func onViewControllerResult() {
        
    }
    
    func onViewControllerResult(params: [String : String]?) {
        
    }
    
    
}
