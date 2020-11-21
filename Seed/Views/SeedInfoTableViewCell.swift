//
//  SeedInfoTableViewCell.swift
//  Seed
//
//  Created by Myron Dulay on 11/21/20.
//  Copyright © 2020 Myron Dulay. All rights reserved.
//

import UIKit

class SeedInfoTableViewCell: UITableViewCell {
  
  lazy var view: UIView = {
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let view = UIView(frame: CGRect(x: 10, y: 5, width: screenWidth - 20, height: 60.0))
    view.backgroundColor = .seedMagenta
    return view
  }()
  
  override class func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    self.contentView.backgroundColor = UIColor.clear
    backgroundColor = UIColor.clear
    view.layer.cornerRadius = 3
    view.clipsToBounds = true
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    addSubview(view)
    
  }
  
}
