//
//  RouteListViewController.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/10/10.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class RouteListViewController: UIViewController, ViewModelBindable {
    
    var viewModel: RouteListViewModelType!
    
    lazy var routeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .white
        tableView.separatorInsetReference = .fromAutomaticInsets
        tableView.allowsMultipleSelectionDuringEditing = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: celltype.nibName, bundle: nil), forCellReuseIdentifier: celltype.identifier)
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableView.automaticDimension
        tableView.bouncesZoom = false
        return tableView
    }()
    
    let celltype: RouteListCellType = .routeList

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func bindViewModel() {
        
    }
    
    fileprivate func setUI() {
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

        test.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        test.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        test.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.view.layoutIfNeeded()
        test.routes = routes
        
        self.view.addSubview(routeTableView)
        
        routeTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive =  true
        routeTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        routeTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        routeTableView.topAnchor.constraint(equalTo: test.bottomAnchor, constant: 36).isActive = true
        
        
        routeTableView.reloadData()
    }
    


}

extension RouteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: celltype.identifier, for: indexPath)
        if let routeCell = cell as? RouteVideoListCell {
            routeCell.dividerView.isHidden = indexPath.item == 0
            routeCell.fill()
            return routeCell
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    


}
