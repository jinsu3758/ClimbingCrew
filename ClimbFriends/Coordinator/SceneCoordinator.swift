//
//  SceneCoordinator.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/20.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

enum TransitionStyle {
    case modal(UIModalTransitionStyle)
    case push
}

protocol CoordinatorType {
    func transition(to scene: Scene, style: TransitionStyle, animated: Bool, completion: (() -> Void)?)
    func close(to scene: Scene?, animated: Bool, completion: (() -> Void)?)
}

class SceneCoordinator: CoordinatorType {
    
    private var currentViewController: UIViewController
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.currentViewController = navigationController
    }
    
    func transition(to scene: Scene, style: TransitionStyle, animated: Bool, completion:  (() -> Void)?) {
        let viewController = scene.viewController(coordinator: self)
        
        switch style {
        case .modal(let modalStyle):
            currentViewController.modalTransitionStyle = modalStyle
            currentViewController.present(viewController, animated: animated, completion: completion)
            currentViewController = viewController
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
            currentViewController = viewController
            completion?()
        }
    }
    
    func close(to scene: Scene?, animated: Bool, completion: (() -> Void)?) {
        if let presentingViewController = currentViewController.presentingViewController {
            currentViewController.dismiss(animated: animated, completion: completion)
            currentViewController = presentingViewController
        }
        else {
            navigationController.popViewController(animated: animated)
            currentViewController = navigationController.viewControllers.last!
            completion?()
        }
    }
    
    
}
