//
//  Security.swift
//  VentasTotalPlayiOS
//
//  Created by Jorge Hdez Villa on 06/02/17.
//  Copyright © 2017 TotalPlay. All rights reserved.
//

import UIKit

extension NSData {
    
    func MD5() -> NSData {
        var hash: [UInt8] = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(self.bytes, CC_LONG(self.length), &hash)
        return NSData(bytes: &hash, length: hash.count)
    }
    
    func copyWithCount(count: Int) -> NSData {
        var array = [UInt8](repeating: 0, count: count)
        self.getBytes(&array, length:self.length)
        return NSData(bytes: array, length: count)
    }
}

public class Security: NSObject {
    
    public class func crypt(text: String) -> String{
        if text != "" {
            let textString = text as NSString
            let secretKey = "oaguser" as NSString
            let cString = secretKey.cString(using: String.Encoding.utf8.rawValue)
            let digestOfPassword = NSData(bytes: cString, length: secretKey.length).MD5()
            let keyData = digestOfPassword.copyWithCount(count: 24)
            
            let cStringText = textString.cString(using: String.Encoding.utf8.rawValue)
            let encryptData = NSData(bytes: cStringText, length: textString.length)
            
            
            let buffer_size : size_t = keyData.length + kCCBlockSize3DES
            let buffer = UnsafeMutablePointer<NSData>.allocate(capacity: buffer_size)
            var num_bytes_encrypted : size_t = 0
            
            let operation: CCOperation = UInt32(kCCEncrypt)
            let algoritm:  CCAlgorithm = UInt32(kCCAlgorithm3DES)
            let options:   CCOptions   = UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding)
            let keyLength        = size_t(kCCKeySize3DES)
            
            let Crypto_status: CCCryptorStatus = CCCrypt(operation, algoritm, options, keyData.bytes, keyLength, nil, encryptData.bytes, encryptData.length, buffer, buffer_size, &num_bytes_encrypted)
            
            if UInt32(Crypto_status) == UInt32(kCCSuccess){
                let result: NSData = NSData(bytes: buffer, length: num_bytes_encrypted)
                free(buffer)
                return result.base64EncodedString(options: [])
            }else{
                free(buffer)
                return ""
            }
        } else {
            return ""
        }
    }
    
    class func decrypt(text: String) -> String{
        if text != "" {
            let secretKey = "oaguser" as NSString
            let cString = secretKey.cString(using: String.Encoding.utf8.rawValue)
            let digestOfPassword = NSData(bytes: cString, length: secretKey.length).MD5()
            let keyData = digestOfPassword.copyWithCount(count: 24)
            
            let base64 = NSData(base64Encoded: text, options: [])
            
            
            let buffer_size : size_t = keyData.length + kCCBlockSize3DES
            let buffer = UnsafeMutablePointer<NSData>.allocate(capacity: buffer_size)
            var num_bytes_encrypted : size_t = 0
            
            let operation: CCOperation = UInt32(kCCDecrypt)
            let algoritm:  CCAlgorithm = UInt32(kCCAlgorithm3DES)
            let options:   CCOptions   = UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding)
            let keyLength        = size_t(kCCKeySize3DES)
            
            let Crypto_status: CCCryptorStatus = CCCrypt(operation, algoritm, options, keyData.bytes, keyLength, nil, base64!.bytes, base64!.length, buffer, buffer_size, &num_bytes_encrypted)
            
            if UInt32(Crypto_status) == UInt32(kCCSuccess){
                let result: NSData = NSData(bytes: buffer, length: num_bytes_encrypted)
                free(buffer)
                if let string = String(data: result as Data, encoding: String.Encoding.utf8) {
                    return string
                }
                return ""
            }else{
                free(buffer)
                return ""
            }
        } else {
            return ""
        }
        
    }
    
}
