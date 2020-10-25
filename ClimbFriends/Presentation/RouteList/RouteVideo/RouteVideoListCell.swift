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
    @IBOutlet weak var levelColorView: LevelColorView!
    @IBOutlet weak var routeColorView: UIView!
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        videoCollectionView.register(VideoCell.self, forCellWithReuseIdentifier: CellType.video.identifier)
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.video.identifier, for: indexPath)
        if let videoCell = cell as? VideoCell {
            videoCell.fill()
            return videoCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CellType.video.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    
    
    
    
    
}
