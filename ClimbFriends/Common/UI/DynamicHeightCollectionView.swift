//
//  DynamicHeightCollectionView.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/27.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    @IBInspectable
    var numberOfColumn: CGFloat = 0
    
    @IBInspectable
    var cellHeight: CGFloat = 0
    
    @IBInspectable
    
    var lineSpacing: CGFloat = 0
    
    override var intrinsicContentSize: CGSize {
        let count = CGFloat(numberOfItems(inSection: 0))
        if count < numberOfColumn {
            return CGSize(width: UIScreen.main.bounds.width, height: cellHeight)
        }
        
        let lineSpacingSum = (ceil(count / numberOfColumn) - 1) * lineSpacing
        
        return CGSize(width: UIScreen.main.bounds.width, height: cellHeight * CGFloat(ceil(count / numberOfColumn)) + lineSpacingSum)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }

}
