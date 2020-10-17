//
//  Scene.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/20.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

enum Scene {
    case home(HomeViewModel)
    
    var storyboardName: String {
        switch self {
        case .home(_):
            return "Home"
        }
    }
    
    var identifier: String {
        switch self {
        case .home(_):
            return "homeViewController"
        }
    }
    
    func viewController(coordinator: CoordinatorType) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.identifier)
        
        switch self {
        case .home(let viewModel):
            guard var vc = viewController as? HomeViewController else { break }
//            let viewModel = HomeViewModel(coordinator: coordinator)
            vc.bind(viewModel: viewModel)
            return vc
        }
        
        return viewController
    }
    
}
