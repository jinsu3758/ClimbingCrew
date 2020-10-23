//
//  LayerGuideView.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/05.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class LevelGuideView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var gymTitleLabel: UILabel!
    @IBOutlet weak var videoNumLabel: UILabel!
    @IBOutlet weak var lowestLevelLabel: UILabel!
    @IBOutlet weak var highestLevelLabel: UILabel!
    @IBOutlet weak var levelColorStackView: UIStackView!
    @IBOutlet weak var routeContentView: UIView!
    @IBOutlet weak var routeContentViewHeightConstraint: NSLayoutConstraint!
    
    var isFoldabled: Bool = false {
        didSet {
            dotLines.forEach { line in
                line.removeLine(height: routeViewHeight)
            }
            if isFoldabled {
                self.routeContentViewHeightConstraint.constant = 21
            }
            else {
                self.routeContentViewHeightConstraint.constant = routeViewHeight
            }
            UIView.animate(withDuration: 0.3, animations: { [unowned self] in
                self.routeStackViews.forEach { view in
                    view.alpha = self.isFoldabled ? 0 : 1
                }
                self.layoutIfNeeded()
            })
        }
    }
    
    var routes: [GymRoute] = [] {
        didSet {
            setRoute()
        }
    }
    
    private var dotLines: [UIView] = []
    private var routeStackViews: [UIStackView] = []
    private var routeViewHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = Bundle.main.loadNibNamed("LevelGuideView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)

        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 36
        contentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        contentView.layer.setShadow(color: .pinkishGrey84, alpha: 1, x: 0, y: 0.5, blur: 2, spread: 0)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setRoute() {
        let stackViewWidth = levelColorStackView.frame.width
        let stackViewSpacing = floor((stackViewWidth - CGFloat(routes.count * 16)) / CGFloat(routes.count - 1))
        levelColorStackView.spacing = stackViewSpacing
        
        var tempCount: Int = 0
        
        routes.forEach { route in
            let levelView = UIView()
            levelView.translatesAutoresizingMaskIntoConstraints = false
            levelView.backgroundColor = route.levelColor
            levelView.cornerRadius = 8
            levelView.layer.borderWidth = 1
            levelView.layer.borderColor = UIColor.warmGreyTwo.cgColor
            
            levelColorStackView.addArrangedSubview(levelView)
            levelView.widthAnchor.constraint(equalToConstant: 16).isActive = true
            levelView.heightAnchor.constraint(equalToConstant: 16).isActive = true
            
//            let routeDotLine = UIView()
            let routeDotLine = UIView()
            routeDotLine.translatesAutoresizingMaskIntoConstraints = false
            routeContentView.addSubview(routeDotLine)
//            self.addSubview(routeDodLine)
            dotLines.append(routeDotLine)
            
            routeDotLine.widthAnchor.constraint(equalToConstant: 0.3).isActive = true
            routeDotLine.topAnchor.constraint(equalTo: routeContentView.topAnchor).isActive = true
            routeDotLine.bottomAnchor.constraint(equalTo: routeContentView.bottomAnchor).isActive = true
            routeDotLine.centerXAnchor.constraint(equalTo: levelView.centerXAnchor).isActive = true
            
            let routeStackView = UIStackView()
            routeStackView.translatesAutoresizingMaskIntoConstraints = false
            routeStackView.axis = .vertical
            routeStackView.alignment = .fill
            routeStackView.distribution = .fillEqually
            routeStackView.spacing = 8
            routeStackViews.append(routeStackView)

//            self.addSubview(routeStackView)
            routeContentView.addSubview(routeStackView)
            
            if route.routeColors.count > tempCount {
                tempCount = route.routeColors.count
                routeViewHeight = CGFloat(tempCount * 9 + (tempCount - 1) * 8 + 24 + 12)
            }

            route.routeColors.forEach { color in
                let colorView = UIView()
                colorView.translatesAutoresizingMaskIntoConstraints = false
                colorView.backgroundColor = color
                colorView.cornerRadius = 5

                routeStackView.addArrangedSubview(colorView)
                colorView.widthAnchor.constraint(equalToConstant: 14).isActive = true
                colorView.heightAnchor.constraint(equalToConstant: 9).isActive = true
            }
            
            routeStackView.widthAnchor.constraint(equalToConstant: 16).isActive = true
            routeStackView.topAnchor.constraint(equalTo: routeContentView.topAnchor, constant: 12).isActive = true
//            routeStackView.bottomAnchor.constraint(lessThanOrEqualTo: routeContentView.bottomAnchor, constant: 24).isActive = true
//            routeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24).isActive = true
            routeStackView.centerXAnchor.constraint(equalTo: levelView.centerXAnchor).isActive = true
            
//            routeDodLine.layoutIfNeeded()
//            routeDodLine.setDotLine(0.3, color: .black40, dotWidth: 1, gapWidth: 0.5)
        }
        
        updateDotLine()
    }
    
    private func updateDotLine() {
        routeContentViewHeightConstraint.constant = routeViewHeight
        self.layoutIfNeeded()
        dotLines.forEach { line in
            line.setDotLine(0.3, color: .black40, dotWidth: 1, gapWidth: 0.5)
        }
    }
    
    @IBAction func testButton(_ sender: Any) {
        isFoldabled = !isFoldabled
    }
    
}
