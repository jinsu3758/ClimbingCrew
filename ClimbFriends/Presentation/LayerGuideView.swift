//
//  LayerGuideView.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/05.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class LevelGuideView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.layer.setShadow(color: .pinkishGrey84, alpha: 1, x: 0, y: 0.5, blur: 2, spread: 0)
        
    }

}
