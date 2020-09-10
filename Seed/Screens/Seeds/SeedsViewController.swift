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
		SeedData(title: "My First Seed"),
		SeedData(title: "My Second Seed"),
		SeedData(title: "My Third Seed"),
	]
	
	fileprivate let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.register(SeedViewCell.self, forCellWithReuseIdentifier: "cell")
		return cv
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setupCollectionView()
		self.view.backgroundColor = .seedCream
		
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
}


extension SeedsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
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

