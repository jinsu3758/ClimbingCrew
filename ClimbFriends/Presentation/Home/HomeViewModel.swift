//
//  HomeViewModel.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/20.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation

protocol HomeViewModelInput {
    func selectItem(index: Int)
}

protocol HomeViewModelOutput {
    var output: (() -> Void)? { get }
}

protocol HomeViewModelType: HomeViewModelInput, HomeViewModelOutput {
    
}

class HomeViewModel: BaseViewModel, HomeViewModelType {
    var output: (() -> Void)?
    
    
}

extension HomeViewModel {
    func selectItem(index: Int) {
        let routeListViewModel = RouteListViewModel(coordinator: coordinator)
        let routeListScene = Scene.routeList(routeListViewModel)
        coordinator.transition(to: routeListScene, style: .push, animated: true)
        
//        output?()
    }
}
