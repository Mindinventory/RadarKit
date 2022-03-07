//
//  CustomRadarView.swift
//
//  Created by Parth Gohel on 29/12/21.
//

import Foundation
import UIKit

public final class CustomRadarView: RadarView {
    
    public var lightRadarView: RadarView = RadarView()
    private var lightAngles: [Angle] = []
    private var angles: [Angle] = []
    
    @IBInspectable public override var numberOfCircles: Int {
        didSet {
            lightRadarView.numberOfCircles = self.numberOfCircles*2
            configureCircleArc()
            configurelightCircleArc()
        }
    }
    
    @IBInspectable public var paddingBetweenCircle: Double = 40 {
        didSet {
            paddingBetweenCircles = paddingBetweenCircle.aspectToWidth.toCGFloat()
            lightRadarView.paddingBetweenCircles = (paddingBetweenCircle/2).aspectToWidth.toCGFloat()
        }
    }
    
    @IBInspectable public override var isRotateRingAnimation: Bool {
        didSet {
            lightRadarView.isRotateRingAnimation = isRotateRingAnimation
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        configureLightRadarView()
    }
}

extension CustomRadarView {
    
    private func configureLightRadarView() {
        
        lightRadarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lightRadarView)
        NSLayoutConstraint.activate(
            [
                lightRadarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                lightRadarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                lightRadarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                lightRadarView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ]
        )
        configureRings()
    }
    
    private func configureRings() {
        
        lightRadarView.diskRadius = 0.0
        lightRadarView.dotColor = UIColor.lightRingStroke.filterNil
        lightRadarView.circleOnColor = UIColor.lightRingOnColor.filterNil
        lightRadarView.circleOffColor = UIColor.lightRingStroke.filterNil
        lightRadarView.paddingBetweenItems = 0
        lightRadarView.isRotateRingAnimation = isRotateRingAnimation

    }
    
    private func configureCircleArc() {
        angles.removeAll()
        for index in 0 ..< numberOfCircles {
            if index % 2 == 0 { angles.append(.leftAngle) }
            else { angles.append(.rightAngle) }
        }
        self.circleArc = angles
    }
    
    private func configurelightCircleArc() {
        lightAngles.removeAll()
        for index in 0 ..< numberOfCircles {
            lightAngles.append(.zero)
            if index % 2 == 0 { lightAngles.append(.lightRightAngle) }
            else { lightAngles.append(.lightLeftAngle) }
        }
        lightRadarView.circleArc = lightAngles
    }
}
