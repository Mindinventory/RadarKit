//
//  Bundle+Extension.swift
//  RadarKit
//
//  Created by Parth Gohel on 30/12/21.
//

import UIKit

extension Bundle {

    public var resouceBundle: Bundle {
        return Bundle(identifier: "org.cocoapods.RadarKit") ?? .main
    }
}
