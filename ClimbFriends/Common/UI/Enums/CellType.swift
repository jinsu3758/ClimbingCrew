//
//  CellType.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/18.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

enum CellType {
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
            return CGSize(width: 172, height: 172)
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
