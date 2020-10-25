//
//  UIKitExtension.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/14.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
    
    func setDotLine(_ width: CGFloat, color: UIColor = .gray, dotWidth: NSNumber, gapWidth: NSNumber) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineDashPattern = [dotWidth, gapWidth] // 7 is the length of dash, 3 is length of the gap.
        shapeLayer.name = "dotLine"
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: self.bounds.minX, y: self.bounds.minY), CGPoint(x: self.bounds.minX, y: self.bounds.maxY)])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    func updateDotLine(_ height: CGFloat?) {
        self.layer.sublayers?.forEach {
            if $0.name == "dotLine" {
                guard let height = height else {
                    $0.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
                    return
                }
                let sy = height / self.frame.height
                $0.transform = CATransform3DMakeScale(1.0, sy, 1.0)
            }
        }
    }
    
    func update() {
        self.layer.sublayers?.forEach {
            if $0.name == "dotLine" {
                $0.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
            }
        }
    }
}

extension UIViewController {
    class func viewController(from storyboardName: String) -> UIViewController {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className)
    }
    
    class var className: String {
        return String.init(describing: self).components(separatedBy: ".").last!
    }
    
    func viewController<T: UIViewController>(storyboard: String) -> T? {
        let storyBoard = UIStoryboard.init(name: storyboard, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: T.className) as? T
    }
   
}

@IBDesignable
extension UIButton {
    @IBInspectable var selectedImage: UIImage {
        get { self.selectedImage }
        set { self.setImage(newValue, for: .selected)}
    }
    
    @IBInspectable var normalImage: UIImage {
        get { self.normalImage }
        set { self.setImage(newValue, for: .normal)}
    }
}

extension NSLayoutConstraint {
    @IBInspectable var heightConstraint: CGFloat {
        get { self.heightConstraint }
        set { self.constant = UIScreen.main.bounds.height / 812 * newValue }
    }
    
    @IBInspectable var widtConstraint: CGFloat {
        get { self.widtConstraint }
        set { self.constant = UIScreen.main.bounds.width / 375 * newValue }
    }
}

extension UITableViewCell {
    class var name: String {
        self.description().components(separatedBy: ".").last!
    }
}

