//
//  RoundImageView.swift
//
//  Created by Parth Gohel on 29/12/21.
//

import Foundation
import UIKit

final public class RoundImageView: UIImageView {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }
}
