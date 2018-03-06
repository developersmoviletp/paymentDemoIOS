//
//  CreditCardUtils.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 21/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class CreditCardUtils: NSObject {
    
    static func GetTypeCard(card : String) -> String {
        
        let regexVisa = "(4[0-9]{12}(?:[0-9]{3})?)"
        let regexMasterC = "(5[1-5][0-9]{14})"
        let regexAmEx = "(3[47][0-9]{13})"
        
        
        let predicateVisa = NSPredicate(format:"SELF MATCHES %@", regexVisa)
        let predicateMaster = NSPredicate(format:"SELF MATCHES %@", regexMasterC)
        let predicateAmex = NSPredicate(format:"SELF MATCHES %@", regexAmEx)
        
        var result : String = ""
        if predicateVisa.evaluate(with: card.trim()) {
            result = "Visa"
        } else if predicateMaster.evaluate(with: card.trim()) {
            result = "Master Card"
        } else if predicateAmex.evaluate(with: card.trim()){
            result = "American Express"
        }
        return result
    }
    
    
    static func GetIdTypeCard(card : String) -> String {
        
        let regexVisa = "(4[0-9]{12}(?:[0-9]{3})?)"
        let regexMasterC = "(5[1-5][0-9]{14})"
        let regexAmEx = "(3[47][0-9]{13})"
        
        
        let predicateVisa = NSPredicate(format:"SELF MATCHES %@", regexVisa)
        let predicateMaster = NSPredicate(format:"SELF MATCHES %@", regexMasterC)
        let predicateAmex = NSPredicate(format:"SELF MATCHES %@", regexAmEx)
        
        var result : String = "0"
        if predicateVisa.evaluate(with: card.trim()) {
            result = "3"
        } else if predicateMaster.evaluate(with: card.trim()) {
            result = "2"
        } else if predicateAmex.evaluate(with: card.trim()){
            result = "1"
        }
        return result
    }
    
}
