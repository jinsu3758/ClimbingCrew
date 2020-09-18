//
//  UIColorExtension.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/17.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
    
    class var textBlack: UIColor {
        UIColor(red: 51, green: 51, blue: 51)
    }
}
