//
//  SegmentedControlValidator.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 29/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class SegmentedControlValidator: Validator {

    public var mValidators : [Validator] = []
    public var mSegmentedControl : UISegmentedControl!
    public var mPositionValue : Int = 0
    
    public init(segmentedControl : UISegmentedControl, positionValue : Int, validators : Validator...){
        super.init()
        self.mSegmentedControl = segmentedControl
        mPositionValue = positionValue
        for validator in validators{
            self.mValidators.append(validator)
        }
    }
    
    override public func isValid() -> Bool{
        var valid : Bool = true
        if mSegmentedControl.selectedSegmentIndex == mPositionValue {
            for validator in mValidators {
                if valid && !validator.isValid() {
                    valid = false
                }
            }
        }
        return valid
    }
    
    override public func showError(valid : Bool){
        for validator in mValidators {
            validator.showError(valid: validator.isValid())
        }
    }
    
}
