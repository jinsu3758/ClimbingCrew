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
    case routeList(RouteListViewModel)
    
    var storyboardName: String {
        switch self {
        case .home:
            return "Home"
        case .routeList:
            return "RouteList"
        }
    }
    
    var identifier: String {
        switch self {
        case .home:
            return "homeViewController"
        case .routeList:
            return "routeListViewController"
        }
    }
    
    func viewController(coordinator: CoordinatorType) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.identifier)
        
        switch self {
        case .home(let viewModel):
            guard var vc = viewController as? HomeViewController else { break }
            vc.bind(viewModel: viewModel)
            return vc
        case .routeList(let viewModel):
            guard var vc = viewController as? RouteListViewController else { break }
            vc.bind(viewModel: viewModel)
            return vc
        }
        
        return viewController
    }
    
}
