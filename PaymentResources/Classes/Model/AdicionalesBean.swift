import UIKit

open class AddicionalBeanType {
    static var SERVICE : Int = 1
    static var PRODUCT_INCLUYED : Int = 2
    static var PRODUCT_ADDITIONAL : Int = 3
}

public protocol AdicionalesBean: NSObjectProtocol {
    func getAdicionalType() -> Int
    func getID() -> String
    func getAdicionalName() -> String
    
    func getPrecioBase() -> Double
    func getPrecioProntoPago() -> Double
    func getCantidad() -> Double
    func getIVA() -> Double
    func getIEPS() -> Double
}
