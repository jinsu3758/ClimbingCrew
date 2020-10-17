//
//  RouteListViewController.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/10.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class RouteListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let routes: [GymRoute] = [
            GymRoute(level: 0, levelColor: .red, routeColors: [.red, .blue, .gray, .green, .orange, .brown]),
            GymRoute(level: 0, levelColor: .blue, routeColors: [.red, .blue, .gray, .green, .orange, .brown, .magenta]),
            GymRoute(level: 0, levelColor: .black, routeColors: [.red, .blue, .gray, .green, .orange, .brown, .magenta]),
            GymRoute(level: 0, levelColor: .orange, routeColors: [.red, .blue, .gray, .green, .orange, .brown, .magenta]),
            GymRoute(level: 0, levelColor: .brown, routeColors: [.red, .blue, .gray, .green, .orange, .brown, .magenta]),
            GymRoute(level: 0, levelColor: .gray, routeColors: [.red, .blue, .gray, .green, .orange, .brown, .magenta])
        ]
        
        let test = LevelGuideView(frame: self.view.frame)
//        let test = LevelGuideView(frame: CGRect.zero)
        test.gymTitleLabel.text = "서울 볼더스"
        test.videoNumLabel.text = 10.videoNumLabel()
        
        test.translatesAutoresizingMaskIntoConstraints = false
        test.backgroundColor = .clear
        self.view.addSubview(test)

        test.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive = true
        test.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        test.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.view.layoutIfNeeded()
        test.routes = routes

//        let triangle = TriangleView(direction: .down, color: .whiteThree)
//        triangle.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(triangle)
//
//        triangle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        triangle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        triangle.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        triangle.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        

    }
    


}
