//
//  IntExtension.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/10.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation

extension Int {
    func videoNumLabel() -> String {
        return "영상 \(self.description)"
    }
    
    func levelLabel() -> String {
        return String(format: "Lv.%02d", self)
    }
}
