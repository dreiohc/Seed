//
//  SeedViewCell.swift
//  Seed
//
//  Created by Myron Dulay on 9/10/20.
//  Copyright © 2020 Myron Dulay. All rights reserved.
//

import UIKit

class SeedViewCell: UICollectionViewCell {

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
    title.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
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
