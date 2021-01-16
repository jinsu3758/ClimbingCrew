//
//  HomeViewController.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/14.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ViewModelBindable {
    @IBOutlet weak var gymTableView: UITableView!
    
    var viewModel: HomeViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        gymTableView.register(GymCell.self, forCellReuseIdentifier: GymCell.name)
        gymTableView.delegate = self
        gymTableView.dataSource = self
    }

    func bindViewModel() {
        
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gymCell = tableView.dequeueReusableCell(withIdentifier: GymCell.name, for: indexPath) as! GymCell
        return gymCell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
