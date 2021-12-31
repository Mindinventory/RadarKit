//
//  UIColor.swift

import UIKit

public extension UIColor {

    static var ripplePinkDark = UIColor(red: 69.0/255.0, green: 65.0/255.0, blue: 101.0/255.0, alpha: 1.0)
    static var ripplePink = UIColor(red: 199.0/255.0, green: 118.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static var rippleDark = UIColor(red: 98.0/255.0, green: 98.0/255.0, blue: 137.0/255.0, alpha: 1.0)
    static var rippleWhite = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 234.0/255.0, alpha: 1.0)
    static var turquoise = UIColor(red: 96.0/255.0, green: 217.0/255.0, blue: 247.0/255.0, alpha: 1.0)
    static var lightRingStroke =  UIColor(named: "LightRingStroke", in: Bundle().resouceBundle, compatibleWith: nil)
    static var lightRingOnColor = UIColor(named: "LightRingOnColor", in: Bundle().resouceBundle, compatibleWith: nil)
    static var ringStroke = UIColor(named: "RingStroke", in: Bundle().resouceBundle, compatibleWith: nil)
    static var ringOnColor = UIColor(named: "RingOnColor", in: Bundle().resouceBundle, compatibleWith: nil)
    static var colorBlack = UIColor(named: "ColorBlack", in: Bundle().resouceBundle, compatibleWith: nil)
}

extension Optional where Wrapped == UIColor {

    public var filterNil: UIColor {
        guard let safeColor = self else {return .black}
        return safeColor
    }
}
