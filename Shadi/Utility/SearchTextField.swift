//
//  TextField.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

class SearchTextField: UITextField {
	override func awakeFromNib() {
		super.awakeFromNib()
		
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold))
		imageView.tintColor = UIColor("#C8CCD2")
		imageView.contentMode = .center
		imageView.constraint(width: frame.height)
		imageView.constraint(height: frame.height)
		
		rightView = imageView
		rightViewMode = .always
		
		let spaceView = UIView()
		spaceView.constraint(width: frame.height)
		spaceView.constraint(height: frame.height)
		
		leftView = spaceView
		leftViewMode = .always
		
		tag = 1
		semanticContentAttribute = .forceRightToLeft
	}
}
