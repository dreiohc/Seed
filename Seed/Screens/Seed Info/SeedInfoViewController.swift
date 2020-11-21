//
//  SeedInfoViewController.swift
//  Seed
//
//  Created by Myron Dulay on 11/21/20.
//  Copyright © 2020 Myron Dulay. All rights reserved.
//

import UIKit

class SeedInfoViewController: UIViewController {
  
  var tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setTableView()
    //self.view.backgroundColor = .seedSalmon
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func setTableView() {
    self.tableView.frame = self.view.frame
    self.tableView.backgroundColor = UIColor.clear
    self.tableView.delegate = self
    self.tableView.dataSource = self
    //self.tableView.separatorColor = UIColor.clear
    self.tableView.backgroundColor = .seedCream
    self.view.addSubview(self.tableView)
    self.tableView.register(SeedInfoTableViewCell.self, forCellReuseIdentifier: "cell")
//
//    NSLayoutConstraint.activate([
//      self.tableView.topAnchor
//
//    ])
  }
  
}

extension SeedInfoViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
}
