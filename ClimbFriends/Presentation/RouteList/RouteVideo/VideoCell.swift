//
//  VideoCell.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/25.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    lazy var thumbNailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    fileprivate func initView() {
        self.contentView.addSubview(thumbNailImageView)
        self.contentView.addSubview(heartButton)
        
        thumbNailImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        thumbNailImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        thumbNailImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        thumbNailImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        
        heartButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 12).isActive = true
        heartButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 14).isActive = true
        heartButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
    
    func fill() {
        thumbNailImageView.image = UIImage(named: "climbParkBackground")
    }
}
