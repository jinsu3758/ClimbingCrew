//
//  GymCell.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/14.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class GymCell: UITableViewCell {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .extraLight)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        return effectView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gymTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contactStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.spacing = 10  // 임시
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var hompageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(contactDidTap(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var instagramButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(contactDidTap(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var blogButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(contactDidTap(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(contactDidTap(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var topDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gymLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var bottomDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var facilityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func contactDidTap(_ sender: UIButton) {
        switch sender {
        case hompageButton: break
        default: break
        }
    }
    
    private func setLayout() {
        selectionStyle = .none
        contentView.backgroundColor = .white
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(blurView)
        contentView.addSubview(containerView)
        
        containerView.addSubview(gymTitleLabel)
        containerView.addSubview(contactStackView)
        containerView.addSubview(topDividerView)
        containerView.addSubview(gymLogoImageView)
        containerView.addSubview(bottomDividerView)
        containerView.addSubview(locationLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(facilityLabel)
        
        backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        blurView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17).isActive = true
        blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
        
        
        gymTitleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 18).isActive = true
        
        
        
    }

}
