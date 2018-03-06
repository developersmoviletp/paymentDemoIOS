//
//  TextFieldValidator.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/13/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit

public class RegexEnum{
    static let NOT_EMPTY = 1
    static let EMAIL = 2
    static let CP = 3
    static let LENGHT = 4
    static let EQUAL_TO = 5
    static let NOT_EQUAL_TO = 6
    static let RFC = 7 //
    static let DATE_YEAR_LESS_TO = 8
}

public class TextFieldValidator: Validator {

    var textField : UITextField!
    var regex : Int?
    var messageError : String = ""
    var constraintBottom : NSLayoutConstraint?
    var minCharacters : Int = -1
    var maxCharacters : Int = -1
    var required : Bool = false
    var valueText : String = ""
    var year : Int = 0
    let width = CGFloat(1.0)
    
    
    init(textField : UITextField, regex : Int, messageError : String){
        super.init()
        self.textField = textField
        self.regex = regex
        self.messageError = messageError
        self.view = self.textField
    }
    
    init(textField : UITextField, regex : Int){
        super.init()
        self.textField = textField
        self.regex = regex
        self.view = self.textField
        
        var border = CALayer()
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    init (textField: UITextField, regex : Int, year : Int, messageError : String){
        super.init()
        self.textField = textField
        self.regex = regex
        self.year = year
        self.messageError = messageError
        self.view = self.textField
    }
    
    init(textField : UITextField, minCharacters : Int, maxCharacters : Int, messageError : String){
        super.init()
        self.textField = textField
        self.messageError = messageError
        self.view = self.textField
        self.minCharacters = minCharacters
        self.maxCharacters = maxCharacters
    }
    
    init(textField : UITextField, regex : Int, minCharacters : Int, maxCharacters : Int, messageError : String){
        super.init()
        self.textField = textField
        self.messageError = messageError
        self.view = self.textField
        self.regex = regex
        self.minCharacters = minCharacters
        self.maxCharacters = maxCharacters
    }
    
    init(textField : UITextField, regex : Int, valueText : String){
        super.init()
        self.textField = textField
        self.regex = regex
        self.view = self.textField
        self.valueText = valueText
    }
    
    override func isValid() -> Bool{
        var valid : Bool = true
        
        if minCharacters != -1 && textField?.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != ""{
            valid = valid && (self.textField?.text?.characters.count)! >= minCharacters ? true : false
        }
        if maxCharacters != -1 && textField?.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != ""{
            valid = valid && (self.textField?.text?.characters.count)! <= maxCharacters ? true : false
        }
        let trimmedString = textField?.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if regex == RegexEnum.NOT_EMPTY{
            valid = trimmedString != "" && valid ? true : false
        } else if (regex == RegexEnum.CP){
            
        } else if (regex == RegexEnum.EQUAL_TO){
            valid = valueText == trimmedString
        } else if (regex == RegexEnum.NOT_EQUAL_TO){
            valid = valueText != trimmedString
        } else if (regex == RegexEnum.DATE_YEAR_LESS_TO){
            if self.textField?.text! != "" {
                let date : Date = DateUtils.toDate(date: (self.textField?.text!)!)
                let calendar = Calendar.current
                let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: date)
                let diffYears : Int = components.year!
                
                valid = diffYears > year
            } else {
                valid = false
            }
        } else if (regex == RegexEnum.RFC){
            let rfcRegEx = "[A-Z,Ñ,&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z,0-9]?[A-Z,0-9]?[0-9,A-Z]?"
            
            let test = NSPredicate(format:"SELF MATCHES %@", rfcRegEx)
            valid = test.evaluate(with: trimmedString)
        } else if (regex == RegexEnum.EMAIL) {
            let rfcRegEx = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
            let test = NSPredicate(format:"SELF MATCHES %@", rfcRegEx)
            valid = test.evaluate(with: trimmedString)
        }
        

        return valid
    }
    
    override func showError(valid : Bool){
        var border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        if !valid {
            border.borderColor = UIColor.red.cgColor
        } else {
            border.borderColor = UIColor.darkGray.cgColor
        }
        textField.layer.addSublayer(border)
    }
    
    
}
