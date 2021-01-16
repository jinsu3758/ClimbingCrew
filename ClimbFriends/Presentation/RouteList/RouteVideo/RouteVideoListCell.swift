//
//  RouteVideoListCell.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/25.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class RouteVideoListCell: UITableViewCell {
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var videoCountLabel: UILabel!
    @IBOutlet weak var videoCollectionView: DynamicHeightCollectionView!
    @IBOutlet weak var levelColorView: LevelColorView!
    @IBOutlet weak var routeColorView: UIView!
    @IBOutlet weak var dividerView: UIView!
    
    private let celltype = RouteListCellType.video
    
    var isHiddenDivider: Bool = false {
        didSet {
            dividerView.isHidden = isHiddenDivider
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        videoCollectionView.register(VideoCell.self, forCellWithReuseIdentifier: celltype.identifier)
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        videoCollectionView.cellHeight = celltype.size.height
    }
    
    func fill() {
        videoCollectionView.reloadData()
    }
    
}

extension RouteVideoListCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: celltype.identifier, for: indexPath)
        if let videoCell = cell as? VideoCell {
            videoCell.fill()
            return videoCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return celltype.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
}
