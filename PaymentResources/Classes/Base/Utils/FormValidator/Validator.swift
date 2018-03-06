//
//  Validator.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/13/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit

public class Validator: NSObject {
    
    @objc dynamic var view : UIView!

    func isValid() -> Bool {
        preconditionFailure("This method must be overridden")
    }
    
    func showError(valid : Bool){
        preconditionFailure("This method must be overridden")
    }
    
}
