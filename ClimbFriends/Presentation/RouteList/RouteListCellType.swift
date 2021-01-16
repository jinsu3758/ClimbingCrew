//
//  RouteListCellType.swift
//  ClimbFriends
//
//  Created by 박진수 on 2021/01/15.
//  Copyright © 2021 jinsu. All rights reserved.
//

import UIKit

enum RouteListCellType {
    case routeList
    case video
    
    var identifier: String {
        switch self {
        case .video:
            return "videoCell"
        case .routeList:
            return "routeListCell"
        }
    }
    
    var size: CGSize {
        switch self {
        case .video:
            let size = ((UIScreen.main.bounds.width - 12 * 2 - 6) / 2)
            return CGSize(width: size, height: size)
        case .routeList:
            return CGSize.zero
        }
    }
    
    var nibName: String {
        switch self {
        case .video:
            return "doesn't have nib"
        case .routeList:
            return "RouteVideoListCell"
            
        }
    }
    
}
