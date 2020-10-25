//
//  TriangleView.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/12.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

enum TriangleDirection {
    case up
    case down
    case right
    case left
}

@IBDesignable
class TriangleView: UIView {
    @IBInspectable private var color: UIColor = .gray
    var direction: TriangleDirection = .up
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    convenience init(_ frame: CGRect = CGRect.zero, direction: TriangleDirection, color: UIColor = .gray) {
        self.init(frame: frame)
        self.direction = direction
        self.color = color
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    fileprivate func initView() {
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        switch direction {
        case .up:
            context.move(to: CGPoint(x: rect.width / 2, y: 0))
            context.addLine(to: CGPoint(x: 0, y: rect.height))
            context.addLine(to: CGPoint(x: rect.width, y: rect.height))
        case .down:
            context.move(to: CGPoint(x: 0, y: 0))
            context.addLine(to: CGPoint(x: rect.width, y: 0))
            context.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
        case .right:
            context.move(to: CGPoint(x: rect.width / 2, y: 0))
            context.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
            context.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
        case .left:
            context.move(to: CGPoint(x: rect.width / 2, y: 0))
            context.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
            context.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
        
        context.closePath()
        context.setFillColor(color.cgColor)
        context.fillPath()
    }
    
    
  

}
