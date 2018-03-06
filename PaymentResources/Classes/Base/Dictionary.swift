//
//  Dictionary.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez Villa on 02/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

extension Dictionary {
    
    subscript(key: APIKeys) -> Value? {
        get {
            return self[String(describing: key) as! Key]
        }
        set(value) {
            guard
                let value = value else {
                    self.removeValue(forKey: String(describing: key) as! Key)
                    return
            }
            
            self.updateValue(value, forKey: String(describing: key) as! Key)
        }
    }
}


protocol APIKeys {}
