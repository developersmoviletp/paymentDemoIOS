//
//  FormValidator.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/13/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit

public class FormValidator: NSObject {

    var validators : NSMutableArray?
    var showAllErrors : Bool?
    var showAnimationError : Bool = true
    
    init(showAllErrors : Bool, showAnimationError : Bool = true) {
        self.validators = NSMutableArray()
        self.showAllErrors = showAllErrors
        self.showAnimationError = showAnimationError
    }
    
    func addValidators(validators : Validator...){
        for validator in validators{
            self.validators?.add(validator)
        }
    }
    
    func isValid() -> Bool{
        var valid : Bool = true
        //showAllErrors = false
        if showAllErrors! {
            for obj in validators! {
                let validator : Validator = obj as! Validator
                
                let isValid : Bool = validator.isValid()
                if showAnimationError {
                    validator.showError(valid: isValid)
                }
                valid = isValid && valid
            }
        } else {
            for obj in validators! {
                let validator : Validator = obj as! Validator
                let isValid : Bool = validator.isValid()
                if showAnimationError {
                    validator.showError(valid: isValid)
                }
                valid = isValid && valid
                if !valid {
                    break
                }
            }
        }
        return valid
    }
    
    
}
