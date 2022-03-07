//
//  ViewController.swift
//  fffff
//
//  Created by Parth Gohel on 30/12/21.
//

import UIKit
import RadarKit

class ViewController:UIViewController {
    
    @IBOutlet private weak var radarView: CustomRadarView!
    
    private var timer: Timer?
    private var index = 1
    private var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(addItem), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    @objc func addItem() {
        if index > 6 {
            //            addMultipleItems()
            timer?.invalidate()
            return
        }
        let user = User(id: UUID(), profileImage: "user\(index)")
        let item = Item(uniqueKey: user.id.uuidString, value: user)
        items.append(item)
        radarView.add(item: item)
        index += 1
    }
    
}

extension ViewController {
    
    private func configureViews() {
        
        configureRadarView()
    }
    
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
}

extension ViewController: RadarViewDelegate {
    
    func radarView(radarView: RadarView, didSelect item: Item) {
        print(item.uniqueKey)
    }
    func radarView(radarView: RadarView, didDeselect item: Item) {}
    
    func radarView(radarView: RadarView, didDeselectAllItems lastSelectedItem: Item) {}
}

extension ViewController: RadarViewDataSource {
    
    func radarView(radarView: RadarView, viewFor item: Item, preferredSize: CGSize) -> UIView {
        
        guard let user = item.value as? User else { return UIImageView() }
        let frame = CGRect(x: 0, y: 0, width: 38, height: 38)
        let imageView = RoundImageView(frame: frame)
        let image = UIImage(named: user.profileImage, in: Bundle().resouceBundle, with: .none)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}
