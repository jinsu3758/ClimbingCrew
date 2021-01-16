//
//  BaseViewModel.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/21.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation

class BaseViewModel {
    let coordinator: CoordinatorType
    
    init(coordinator: CoordinatorType) {
        self.coordinator = coordinator
    }
}
