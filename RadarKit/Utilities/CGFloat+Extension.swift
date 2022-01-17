//
//  CGFloat+Extension.swift
//  Created by Parth Gohel on 28/12/21.
//

import UIKit

extension CGFloat {
    
    var degreeToRadiun: Self {
        .pi*self/180
    }
    
    func toDouble() -> Double {
        Double(self)
    }
}

extension Double {
    
    var aspectToWidth: Self {
        self*UIScreen.main.bounds.width.toDouble()/375
    }
    
    func toCGFloat() -> CGFloat {
       CGFloat(self)
    }
}
