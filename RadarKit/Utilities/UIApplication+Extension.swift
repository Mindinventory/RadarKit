//
//  UIApplication+Extension.swift

import Foundation
import UIKit
extension UIApplication {

    func getKeyWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
                return keyWindow
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
