
//  Drawer.swift

import UIKit

struct Drawer {

    /// Creates a circular layer
    ///
    /// - Parameters:
    ///   - radius: the radius of the circle
    ///   - origin: the origin of the circle
    /// - Returns: a circular layer
    private static func layer(
        radius: CGFloat,
        origin: CGPoint,
        startAngle: CGFloat = 0.0,
        endAngle: CGFloat = 0.0,
        dotColor: CGColor = UIColor.white.cgColor
    ) -> CAShapeLayer {

        let layer = CAShapeLayer()
        layer.bounds = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        layer.position = origin
        let center = CGPoint(x: radius, y: radius)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: true)
        let startPoint = pointOnCircle(center: center, radius: radius, angle: startAngle)
        let endPoint = pointOnCircle(center: center, radius: radius, angle: endAngle)
        if startPoint != endPoint {
            let dotStartLayer = dotLayer(with: startPoint, fillColor: dotColor)
            let dotEndLayer = dotLayer(with: endPoint, fillColor: dotColor)
            layer.addSublayer(dotStartLayer)
            layer.addSublayer(dotEndLayer)
        }
        layer.path = path.cgPath
        return layer
    }
    
    static func pointOnCircle(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint {
        let x = center.x + radius * cos(angle)
        let y = center.y + radius * sin(angle)
        
        return CGPoint(x: x, y: y)
    }
    
    static func dotLayer(with point: CGPoint,fillColor: CGColor) -> CAShapeLayer {

        let layer = CAShapeLayer()
        let radius = 4.0
        let path = UIBezierPath(ovalIn: CGRect(x: point.x.toDouble() - radius, y: point.y.toDouble() - radius, width: 2*radius, height: 2*radius))
        layer.path = path.cgPath
        layer.fillColor = fillColor
        return layer
    }

    /// Creates a disk layer
    ///
    /// - Parameters:
    ///   - radius: the radius of the disk
    ///   - origin: the origin of the disk
    ///   - color: the color of the disk
    /// - Returns: a disk layer
    static func diskLayer(radius: CGFloat, origin: CGPoint, color: CGColor) -> CAShapeLayer {
        let diskLayer = self.layer(radius: radius, origin: origin)
        diskLayer.fillColor = color

        return diskLayer
    }
    
    /// Creates a circle layer
    ///
    /// - Parameters:
    ///   - radius: the radius of the circle
    ///   - origin: the origin of the circle
    ///   - color: the color of the circle
    /// - Returns: a circle layer
    static func circleLayer(
        radius: CGFloat,
        origin: CGPoint,
        color: CGColor,
        dotColor: CGColor = UIColor.white.cgColor,
        startAngle: CGFloat = 0.0,
        endAngle: CGFloat = 0.0
    ) -> CAShapeLayer {
        let circleLayer = self.layer(radius: radius, origin: origin,startAngle: startAngle,endAngle: endAngle,dotColor: dotColor)
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = color
        circleLayer.lineWidth = 1.0
        return circleLayer
    }
}
