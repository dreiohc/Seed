//
//  SeedsViewController.swift
//  Seed
//
//  Created by Myron Dulay on 8/22/20.
//  Copyright © 2020 Myron Dulay. All rights reserved.
//

import iCarousel
import UIKit

class SeedsViewController: UIViewController {
	let data = [
		SeedData(title: "Do 10 Push ups"),
		SeedData(title: "Study 10 minutes"),
		SeedData(title: "Walk outside for 30 minutes"),
    SeedData(title: "Meditate"),
    SeedData(title: "Study Art of Knot"),
    SeedData(title: "Write journal"),
    SeedData(title: "Do Tai-chi for 20 minutes"),
    SeedData(title: "Schedule a date to find an outdoor venue for wedding")
	]

  fileprivate let seedCarousel: iCarousel = {
    let view = iCarousel()
    view.type = .rotary
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

	override func viewDidLoad() {
		super.viewDidLoad()
    self.view.backgroundColor = .seedCream
    self.setupCarousel()
    self.setupButton()
	}
  
  private func setupCarousel() {
    self.view.addSubview(seedCarousel)
    self.seedCarousel.dataSource = self
    
    let screenSize = UIScreen.main.bounds
    let screenHeight = screenSize.height
    let screenWidth = screenSize.width
    
    NSLayoutConstraint.activate([
      self.seedCarousel.widthAnchor.constraint(equalToConstant: (screenWidth)),
      self.seedCarousel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.seedCarousel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.seedCarousel.heightAnchor.constraint(equalToConstant: (screenHeight * 0.5))
    ])
  }

  private func setupButton() {
    view.addSubview(button)
    let screenSize = UIScreen.main.bounds
    let screenHeight = screenSize.height
    let screenWidth = screenSize.width
    self.button.layer.cornerRadius = 10.0
    
    NSLayoutConstraint.activate([
      self.button.topAnchor.constraint(equalTo: self.seedCarousel.bottomAnchor, constant: 80.0),
      self.button.widthAnchor.constraint(equalToConstant: (screenWidth * 0.2)),
      self.button.heightAnchor.constraint(equalToConstant: (screenHeight * 0.05)),
      self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ])
  }
}

extension SeedsViewController: iCarouselDataSource {
  func numberOfItems(in carousel: iCarousel) -> Int {
    return data.count
  }
  
  func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
    let view = UIView(frame: CGRect(x: 50, y: 200, width: self.view.frame.size.width/1.5, height: self.view.frame.size.height/1.5))
    view.backgroundColor = .seedMagenta
    view.layer.cornerRadius = 3.0
    // Set shadow for iCarousel
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 1.75)
    view.layer.shadowRadius = 1.7
    view.layer.shadowOpacity = 0.45
    
    let label: UILabel = {
      let title = UILabel()
      title.textColor = .white
      title.numberOfLines = 0
      title.translatesAutoresizingMaskIntoConstraints = false
      title.textAlignment = .center
      title.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
      return title
    }()
    
    view.addSubview(label)
    label.text = data[index].title
    
    NSLayoutConstraint.activate([
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.widthAnchor.constraint(equalToConstant: view.bounds.width - 20.0),
      label.heightAnchor.constraint(equalToConstant: view.bounds.height - 20.0)
    ])
    return view
  }
}
