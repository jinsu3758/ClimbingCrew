//
//  Scene.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/20.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

enum Scene: String {
    case home
    
    var storyboardName: String {
        switch self {
        case .home:
            return "Home"
        }
    }
    
    func viewController(coordinator: CoordinatorType) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue)
        
        switch self {
        case .home:
            guard var vc = viewController as? HomeViewController else { break }
            let viewModel = HomeViewModel(coordinator: coordinator)
            vc.bind(viewModel: viewModel)
            return vc
        }
        
        return viewController
    }
    
}
