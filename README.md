# RadarKit

<a href="https://docs.swift.org/swift-book/" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/swift-5.0-brightgreen">
</a>
<a href="https://developer.apple.com/ios/" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-iOS-red">
</a>
<a href="https://www.codacy.com?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=nikunjprajapati95/Reading-Animation&amp;utm_campaign=Badge_Grade"><img src="https://app.codacy.com/project/badge/Grade/44b16d6ddb96446b875d38bf2ec89b11"/></a>
<a href="https://github.com/nikunjprajapati95/Reading-Animation/blob/main/LICENSE" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/licence-MIT-orange">
</a>
<p></p> 

## Preview

Discover the world 🌎 around you..!!!

The Radar Kit allowing you to locate places, trip neary by you Or it will help you to search out the people around you with the few lines of code..!!!

The Pod has been used in a project where we discover the list of languages that user want to learn which they can see like below

![gif](/Screenshots/Bingue.png)

Get more for UI/UX from [dribbble](https://dribbble.com/shots/16466945-Bingue-App)<br />

## Requirements
- iOS 12.0+
- Xcode 12.0+

## Installation
To install it, simply add the following line to your Podfile:

```ruby
pod 'RadarKit', git: 'https://github.com/parthgohel2810/RadarKit.git', branch: 'main'
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
        radarView.enableRippleEffect = false
    }
```

#### diskRadius
The radius of the central disk in the view, if you would like to hide it, you can set the radius to 0

#### diskColor
The color of the central disk in the view, the default color is ripplePink color

#### minimumCircleRadius
This property make distance between the first circle and the central disk  

#### numberOfCircles
The number of circles to draw around the disk, the default value is 3

#### paddingBetweenCircle
The padding between circles, circles could be drawn outside the frame 

#### circleOffColor
The color of the off status of the circle, used for animation

#### circleOnColor
The color of the on status of the circle, used for animation

#### animationDuration
The duration of the animation, the default value is 0.9
<br />
You can start/ stop the animation at any time by calling `startAnimation()` & `stopAnimation()`

#### isRotateRingAnimation
Allows circle to rotate, used for animation

#### dotColor
The color of the two dots which place at two end of circle,

#### paddingBetweenItems
The padding between items, the default value is 10

#### remove Ripple effect behind the item
For removal of Ripple effect use `enableRippleEffect` property

## Add items 
If you would like to add one item, use the method `add(item:using:)`
If you would like to add multiple items, it's recommended to use the method `add(items:using:)` for more detail and information please refer `Example` project

#### remove an item 
For removal of an item, use the method `remove(item:)`

#### Customise an item 
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
Action on items can be detected using the protocol `RadarViewDelegate` and implement: 
```swift
radarView?.delegate = self 
...
 func radarView(radarView: RadarView, didSelect item: Item) {
        print(item.uniqueKey)
}
```
## 📱 Check out other lists of our Mobile UI libraries

<a href="https://github.com/Mindinventory?language=kotlin"> 
<img src="https://img.shields.io/badge/Kotlin-0095D5?&style=for-the-badge&logo=kotlin&logoColor=white"> </a>

<a href="https://github.com/Mindinventory?language=swift"> 
<img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white"> </a>

<a href="https://github.com/Mindinventory?language=dart"> 
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"> </a>


<a href="https://github.com/Mindinventory/react-native-tabbar-interaction"> 
<img src="https://img.shields.io/badge/React_Native-20232A?style=for-the-badge&logo=react&logoColor=61DAFB"> </a>
<br></br>

## 💻 Check out other lists of Web libraries

<a href="hhttps://github.com/Mindinventory?language=javascript"> 
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"></a>

<a href="https://github.com/Mindinventory?language=go"> 
<img src="https://img.shields.io/badge/Go-00ADD8?style=for-the-badge&logo=go&logoColor=white"></a>

<a href="https://github.com/Mindinventory?language=python"> 
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"></a>
<br></br>

<h4><a href="https://www.mindinventory.com/whitepapers.php?utm_source=gthb&utm_medium=special&utm_campaign=folding-cell#demo"><u> 📝 Get FREE Industry WhitePapers →</u></a></h4>

## Check out our Work
<a href="https://dribbble.com/mindinventory"> 
<img src="https://img.shields.io/badge/Dribbble-EA4C89?style=for-the-badge&logo=dribbble&logoColor=white" /> </a>
<br></br>

## 📄 License
MI-RadarKit is [MIT-licensed](/LICENSE).

If you use our open-source libraries in your project, please make sure to credit us and Give a star to www.mindinventorycom

<a href="https://www.mindinventory.com/contact-us.php?utm_source=gthb&utm_medium=repo&utm_campaign=swift-ui-libraries">
<img src="https://github.com/Sammindinventory/MindInventory/blob/main/hirebutton.png" width="203" height="43"  alt="app development">
</a>
