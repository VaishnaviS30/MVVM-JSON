//
//  ViewController.swift
//  MVVM+JSON
//
//  Created by Mac on 24/03/21.
//  Copyright © 2021 Vaishnavi Sasane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.vc = self
        //viewModel.getAllUsersData() // Get data by using URLSession
        viewModel.getAllUsersDataByAF() // Get data by using Alamofire
        self.tblView.register(UINib(nibName: cellIdentifiers.userCell, bundle: .main), forCellReuseIdentifier: cellIdentifiers.userCell)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: cellIdentifiers.userCell, for: indexPath) as? UserCell
        cell?.modelUser = viewModel.arrUsers[indexPath.row]
        return cell!
    }
}
