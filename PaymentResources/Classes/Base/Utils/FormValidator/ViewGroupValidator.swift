//
//  ViewGroupValidator.swift
//  VentasTotalPlayiOS
//
//  Created by Jorge Hdez Villa on 13/02/17.
//  Copyright © 2017 TotalPlay. All rights reserved.
//

import UIKit

public class ViewGroupValidator: Validator {

    var validator : Validator!
    var validators : [Validator] = []
    var showAllErrors : Bool = true
    var valueActivator : Bool = true
    
    init(validator : Validator, validators : [Validator], showAllErrors : Bool, valueActivator : Bool){
        self.validator = validator
        self.validators = validators
        self.showAllErrors = showAllErrors
        self.valueActivator = valueActivator
    }
    
    override func isValid() -> Bool {
        var valid = true
        let result = validator.isValid()
        if result == valueActivator {
            for item in validators as [Validator] {
                if !item.isValid() {
                    valid = false
                }
            }
        }
        return valid
    }
    
    override func showError(valid : Bool){
        if showAllErrors {
            for item in validators as [Validator] {
                if !item.isValid() {
                    item.showError(valid: false)
                }
            }
        } else {
            for item in validators as [Validator] {
                if !item.isValid() {
                    item.showError(valid: true)
                    break
                }
            }
        }
    }
    
}
