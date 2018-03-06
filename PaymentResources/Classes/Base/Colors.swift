
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

public class Colors {
    static let color_grey : Int = 0x575B68
    static let color_white_light : Int = 0xCFD2E4
    
    
    static let color_primary : Int = 0x121420
    static let color_primary_green : Int = 0xB4CE30
    
    static let color_black : Int = 0x000000
    static let color_white : Int = 0xFFFFFF
    
    static let color_green_select_plan : Int  = 0xB4CE30
    
    static let color_grey_select_plan : Int = 0x343722
    
    static let color_transparent : Int = 0x000000
}
