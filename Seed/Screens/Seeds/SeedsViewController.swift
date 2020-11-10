//
//  SeedsViewController.swift
//  Seed
//
//  Created by Myron Dulay on 8/22/20.
//  Copyright © 2020 Myron Dulay. All rights reserved.
//

import UIKit

class SeedsViewController: UIViewController {
	let data = [
		SeedData(title: "Do 10 Push ups"),
		SeedData(title: "Study 10 minutes"),
		SeedData(title: "Walk outside for 30 minutes")
	]

	fileprivate let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(SeedViewCell.self, forCellWithReuseIdentifier: "cell")
		return collectionView
	}()
  
  fileprivate let button: UIButton = {
    let title = UIButton()
    title.setTitle("Done", for: .normal)
    title.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
    title.translatesAutoresizingMaskIntoConstraints = false
    title.backgroundColor = .seedPaleGreen
    return title
  }()

	override func viewDidLoad() {
		super.viewDidLoad()
    self.view.backgroundColor = .seedCream
		self.setupCollectionView()
    self.setupButton()
	}

	private func setupCollectionView() {
		view.addSubview(collectionView)
		self.collectionView.backgroundColor = .white
		self.collectionView.showsHorizontalScrollIndicator = false
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.isPagingEnabled = true
		self.collectionView.backgroundColor = .seedCream
		self.collectionView.layer.cornerRadius = 2.0
    
    let screenSize = UIScreen.main.bounds
    let screenHeight = screenSize.height
    let screenWidth = screenSize.width
    
		NSLayoutConstraint.activate([
			self.collectionView.widthAnchor.constraint(equalToConstant: (screenWidth * 0.7)),
			self.collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
			self.collectionView.heightAnchor.constraint(equalToConstant: (screenHeight * 0.5))
		])
	}
  
  private func setupButton() {
    view.addSubview(button)
    let screenSize = UIScreen.main.bounds
    let screenHeight = screenSize.height
    let screenWidth = screenSize.width
    
    NSLayoutConstraint.activate([
      self.button.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 40.0),
      self.button.widthAnchor.constraint(equalToConstant: (screenWidth * 0.2)),
      self.button.heightAnchor.constraint(equalToConstant: (screenHeight * 0.05)),
      self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ])
  }
}

extension SeedsViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let frameSize = collectionView.frame.size
		return CGSize(width: frameSize.width - 10, height: frameSize.height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
	}

}

extension SeedsViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SeedViewCell
		cell.data = self.data[indexPath.row]
		cell.backgroundColor = .seedMagenta
		cell.layer.cornerRadius = 4.0
		return cell
	}

}
