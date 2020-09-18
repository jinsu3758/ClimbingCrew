//
//  UIKitExtension.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/14.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
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

