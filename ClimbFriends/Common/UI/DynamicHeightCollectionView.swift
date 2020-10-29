//
//  DynamicHeightCollectionView.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/27.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }

}
