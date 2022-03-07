//
//  Animation.swift

import UIKit

extension CAShapeLayer {

    func rotateAnimation(isInverse:Bool = false) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: isInverse ? -Double.pi * 2 : Double.pi * 2)
        rotation.duration = 1.5
//        rotation.isCumulative = true
//        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.add(rotation, forKey: "rotationAnimation")
    }

}

extension CALayer {

    func pulseAnimation() {
        let pulse: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = 0.15
        pulse.toValue = 1.4
        pulse.autoreverses = true
        self.contentsScale = UIScreen.main.scale
        self.add(pulse, forKey: "pulse")
    }
}
/// Statics methods for CAAnimation
public struct Animation {
    
    /// Animation by changing the opacity
    ///
    /// - Parameters:
    ///   - fromValue: the initial value of the animation
    ///   - toValue: the final value of the animation
    /// - Returns: a CABasicAnimation object
    public static func opacity(from fromValue: CGFloat, to toValue: CGFloat) -> CABasicAnimation {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = fromValue
        opacityAnimation.toValue = toValue
        
        return opacityAnimation
    }
    
    /// Animation by changing the scale using transform
    ///
    /// - Parameters:
    ///   - fromValue: the initial value of the animation
    ///   - toValue: the final value o the animation
    /// - Returns: a CABasicAnimation object
    public static func transform(from fromValue: CGFloat = 1.0, to toValue: CGFloat) -> CABasicAnimation {
        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = NSValue(caTransform3D: CATransform3DMakeScale(fromValue, fromValue, fromValue))
        transformAnimation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(toValue, toValue, toValue))
        
        return transformAnimation
    }
    
    /// Animation by changing the color
    ///
    /// - Parameters:
    ///   - fromColor: the initial color of the animation
    ///   - toColor: the final color of the animation
    /// - Returns: a CABasicAnimation
    public static func color(from fromColor: CGColor, to toColor: CGColor) -> CABasicAnimation {
        let colorAnimation = CABasicAnimation(keyPath: "strokeColor")
        colorAnimation.fromValue = fromColor
        colorAnimation.toValue = toColor
        colorAnimation.autoreverses = true
        
        return colorAnimation
    }
    
    public static func colorFill(from fromColor: CGColor, to toColor: CGColor) -> CABasicAnimation {
        let colorAnimation = CABasicAnimation(keyPath: "fillColor")
        colorAnimation.fromValue = fromColor
        colorAnimation.toValue = toColor
        colorAnimation.autoreverses = true
        
        return colorAnimation
    }
    
    /// Animation by changing the scale using transform
    ///
    /// - Parameters:
    ///   - times: An array of NSNumber objects that define the time at which to apply a given keyframe segment.
    ///   - values: An array of objects that specify the keyframe values to use for the animation.
    ///   - duration: the duration of the animation, the default value is 0.3
    /// - Returns: a CAKeyframeAnimation object
    public static func transform(times: [NSNumber] = [0.0, 0.5, 1.0], values: [CGFloat] = [0.0, 1.4, 1.0], duration: CFTimeInterval = 0.7) -> CAKeyframeAnimation {
        var transformValues = [NSValue]()
        values.forEach {
            transformValues.append(NSValue(caTransform3D: CATransform3DMakeScale($0, $0, 1.0)))
        }
        let transformAnimation = CAKeyframeAnimation(keyPath: "transform")
        transformAnimation.duration = duration
        transformAnimation.values = transformValues
        transformAnimation.keyTimes = times
        transformAnimation.fillMode = CAMediaTimingFillMode.forwards
        transformAnimation.isRemovedOnCompletion = false
        
        return transformAnimation
    }
    
    /// Animation to hide views, using transform and changing the scale to 0.0
    ///
    /// - Returns: a CAKeyframeAnimation object
    public static func hide() -> CAKeyframeAnimation {
        let hideAnimation = transform(times: [0.0, 0.3, 1.0], values: [1.0, 1.9, 0.0])
        hideAnimation.duration = 1.2
        return hideAnimation
    }
    
    /// Allows multiple animations to be grouped and run concurrently.
    ///
    /// - Parameters:
    ///   - animations: the list of animations
    ///   - duration: the animation duration
    /// - Returns: a CAAnimationGroup object
    public static func group(animations: CAAnimation..., duration: CFTimeInterval) -> CAAnimationGroup {
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = animations
        animationGroup.duration = duration
        
        return animationGroup
    }
}

class PulseAnimation: CALayer {
    
    var animationGroup = CAAnimationGroup()
    var animationDuration: TimeInterval = 1.5
    var radius: CGFloat = 200
    var numebrOfPulse: Float = Float.infinity

    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numberOfPulse: Float = Float.infinity, radius: CGFloat, postion: CGPoint,RippleEffect: Bool){
        super.init()
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numebrOfPulse = numberOfPulse
        self.position = postion
        
        self.bounds = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        self.cornerRadius = radius
        
        if(RippleEffect){
            DispatchQueue.global(qos: .default).async {
                self.setupAnimationGroup()
                DispatchQueue.main.async {
                    self.add(self.animationGroup, forKey: "pulse")
                }
            }
        }
    }
    
    func scaleAnimation() -> CABasicAnimation {
        let scaleAnimaton = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimaton.fromValue = NSNumber(value: 0)
        scaleAnimaton.toValue = NSNumber(value: 1)
        scaleAnimaton.duration = animationDuration
        return scaleAnimaton
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimiation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimiation.duration = animationDuration
        opacityAnimiation.values = [0.4,0.8,0]
        opacityAnimiation.keyTimes = [0,0.3,1]
        return opacityAnimiation
    }
    
    func setupAnimationGroup() {
        self.animationGroup.duration = animationDuration
        self.animationGroup.repeatCount = numebrOfPulse
        let defaultCurve = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [scaleAnimation(),createOpacityAnimation()]
    }
    
    
}
