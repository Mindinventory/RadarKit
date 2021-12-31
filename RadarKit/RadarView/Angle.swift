//
//  Angle.swift
//
//  Created by Parth Gohel on 28/12/21.
//

import Foundation
import UIKit

struct Angle {
    
    let start: CGFloat
    let end: CGFloat
    
    static let rightAngle = Angle(start: 340, end: 280)
    static let leftAngle = Angle(start: 150, end: 80)
    static let lightRightAngle = Angle(start: 380, end: 280)
    static let lightLeftAngle = Angle(start: 220, end: 150)
    static let zero = Angle(start: 0, end: 0)
}
