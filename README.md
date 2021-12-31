# RadarKit

## Example
![](/Screenshots/radar_example_1.mov) ![](/Screenshots/radar_example_3.mov) 

To run the example project, clone the repo, and run `pod install` from the Example directory.
<br />
## Requirements
- iOS 13.0+
- Xcode 13.0

## Installation
To install it, simply add the following line to your Podfile:

```ruby
pod 'RadarKit', git: 'https://github.com/parthgohel2810/RadarKit.git', branch: 'development'
```
## Usage

1. Change the class of a view from UIView to CustomRadarView
```swift
@IBOutlet private weak var radarView: CustomRadarView!
```
2. Programmatically:

```swift
let radarView = CustomRadarView(frame: myFrame)

```

## Customization 

```swift
    private func configureRadarView() {
        
        radarView.delegate = self
        radarView.dataSource = self
        radarView.diskRadius = 0.0
        radarView.dotColor = .ringStroke.filterNil
        radarView.circleOnColor = .ringOnColor.filterNil
        radarView.circleOffColor = .ringStroke.filterNil
        radarView.numberOfCircles = 4
        radarView.isRotateRingAnimation = true
        radarView.paddingBetweenCircle = 36
        radarView.paddingBetweenItems = 20
    }
```

##### diskRadius
The radius of the central disk in the view, if you would like to hide it, you can set the radius to 0

##### diskColor
The color of the central disk in the view, the default color is ripplePink color

##### minimumCircleRadius
This property make distance between the first circle and the central disk  

##### numberOfCircles
The number of circles to draw around the disk, the default value is 3

##### paddingBetweenCircle
The padding between circles, circles could be drawn outside the frame 

##### circleOffColor
The color of the off status of the circle, used for animation

##### circleOnColor
The color of the on status of the circle, used for animation

##### animationDuration
The duration of the animation, the default value is 0.9

#### isRotateRingAnimation
Allows circle to rotate, used for animation

#### dotColor
The color of the two dots which place at two end of circle,

<br />
You can start/ stop the animation at any time by calling `startAnimation()` & `stopAnimation()`

##### paddingBetweenItems
The padding between items, the default value is 10

#### Add items 
If you would like to add one item, use the method `add(item:using:)`
If you would like to add multiple items, it's recommended to use the method `add(items:using:)`

#### remove item 
If you would like to remove an item, use the method `remove(item:)`

#### Custom item 
If you would like to customize items, use the protocol `RadarViewDataSource` and implement: 


```swift
radarView?.dataSource = self 
...
func radarView(radarView: RadarView, viewFor item: Item, preferredSize: CGSize) -> UIView {
        let myCustomItemView = UIView(frame: CGRect(x: 0, y: 0, width: preferredSize.width, height: preferredSize.height))
        return myCustomItemView
}
```

#### CallBack
If you would like to receive action on items, use the protocol `RadarViewDelegate` and implement: 
```swift
radarView?.delegate = self 
...
 func radarView(radarView: RadarView, didSelect item: Item) {
        print(item.uniqueKey)
}
```

## License

RadarKit is available under the MIT license. See the LICENSE file for more info.
