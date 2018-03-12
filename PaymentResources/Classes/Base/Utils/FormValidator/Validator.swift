//
//  Validator.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/13/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit

public class Validator: NSObject {
    
    @objc public dynamic var view : UIView!

    public func isValid() -> Bool {
        preconditionFailure("This method must be overridden")
    }
    
    public func showError(valid : Bool){
        preconditionFailure("This method must be overridden")
    }
    
}
