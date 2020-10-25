//
//  LevelColorView.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/25.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class LevelColorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    fileprivate func initView() {
        self.borderWidth = 1
        self.borderColor = .warmGreyTwo
        self.cornerRadius = self.frame.height / 2
    }


}
