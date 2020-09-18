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
        imageView.image = UIImage(named: "climbParkBackground")
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
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gymTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contactStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hompageButton])
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
        view.backgroundColor = .gray
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
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-ExtraBold", size: 9)
        label.textAlignment = .left
        label.textColor = .textBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-ExtraBold", size: 9)
        label.textAlignment = .left
        label.textColor = .textBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var facilityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-ExtraBold", size: 9)
        label.textAlignment = .left
        label.textColor = .textBlack
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
        
        containerView.topAnchor.constraint(equalTo: blurView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: blurView.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: blurView.trailingAnchor).isActive = true
        
        gymTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18).isActive = true
        gymTitleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        contactStackView.topAnchor.constraint(equalTo: gymTitleLabel.bottomAnchor).isActive = true
        contactStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        contactStackView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        hompageButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        instagramButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        blogButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        callButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        topDividerView.topAnchor.constraint(equalTo: contactStackView.bottomAnchor, constant: 14).isActive = true
        topDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        topDividerView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        topDividerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        gymLogoImageView.topAnchor.constraint(equalTo: topDividerView.bottomAnchor, constant: 10).isActive = true
        gymLogoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        gymLogoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        gymLogoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        bottomDividerView.topAnchor.constraint(equalTo: gymLogoImageView.bottomAnchor, constant: 10).isActive = true
        bottomDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomDividerView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        bottomDividerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: bottomDividerView.bottomAnchor, constant: 14).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 6).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        facilityLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 6).isActive = true
        facilityLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
//        facilityLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 14).isActive = true
        
        
    }

}
