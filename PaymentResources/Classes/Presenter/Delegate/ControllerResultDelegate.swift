//
//  PopUpDelegate.swift
//  ImageTest
//
//  Created by Jorge Hdez Villa on 01/02/17.
//  Copyright © 2017 Jorge Hdez Villa. All rights reserved.
//

import UIKit

public enum ViewControllerResult{
    case RESULT_OK
    case RESULT_ERROR
}

public protocol ControllerResultDelegate: NSObjectProtocol {

    func viewControllerForResult(keyRequest : String, result : ViewControllerResult, data : [String : AnyObject])
    
}
