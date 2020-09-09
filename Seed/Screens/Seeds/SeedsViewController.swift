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
		cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
		return cv
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setupCollectionView()
		
	}

	
	private func setupCollectionView() {
		view.addSubview(collectionView)
		collectionView.backgroundColor = .white
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
		collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
}

extension SeedsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
		cell.data = self.data[indexPath.row]
		cell.backgroundColor = .black
		return cell
	}
}


class CustomCell: UICollectionViewCell {
	
	var data: SeedData? {
		didSet {
			guard let data = data else { return }
			label.text = data.title
		}
	}
	
	fileprivate let label: UILabel = {
		let title = UILabel()
		title.textColor = .white
		title.numberOfLines = 0
		title.translatesAutoresizingMaskIntoConstraints = false
		title.textAlignment = .center
		return title
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(label)
		label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
		label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}




// Uncomment for debug handling
//extension UIApplication {
//	var isDebugMode: Bool {
//		let dictionary = ProcessInfo.processInfo.environment
//		return dictionary["DEBUGMODE"] != nil
//	}
//}
