//
//  OfferCVC.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

class OfferCVC: UICollectionViewCell {

	@IBOutlet weak var label1: UILabel!
	@IBOutlet weak var label2: UILabel!
	@IBOutlet weak var label3: UILabel!
	
	@IBOutlet weak var specialOfferView: UIView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		let style = NSMutableParagraphStyle()
//		style.lineHeightMultiple = 0.75
		style.alignment = .center
		
		let attributes: [NSAttributedString.Key:Any] = [
			.font: UIFont.systemFont(ofSize: 13),
			.paragraphStyle: style
		]
		
		let text1 = NSMutableAttributedString(string: "Full Insurance" + "\n" + "Available", attributes: attributes).with(lineHeightMultiple: 0.65, font: .systemFont(ofSize: 13))
		let text2 = NSMutableAttributedString(string: "Free" + "\n" + "Delivery", attributes: attributes).with(lineHeightMultiple: 0.65, font: .systemFont(ofSize: 13))
		let text3 = NSMutableAttributedString(string: "1500 KM" + "\n" + "Free Per Month", attributes: attributes).with(lineHeightMultiple: 0.65, font: .systemFont(ofSize: 13))
		
		
		if let range = text1.string.NSRange(of: "Full") {
			text1.addAttributes([.foregroundColor: UIColor("15AABE")], range: range)
		}
		
		if let range = text2.string.NSRange(of: "Free") {
			text2.addAttributes([.foregroundColor: UIColor("15AABE")], range: range)
		}
		
		if let range = text3.string.NSRange(of: "Free") {
			text3.addAttributes([.foregroundColor: UIColor("15AABE")], range: range)
		}
		
		label1.attributedText = text1
		label2.attributedText = text2
		label3.attributedText = text3
		
    }

}

extension String {

	func NSRange(of substring: String) -> NSRange? {
		// Get the swift range
		guard let range = range(of: substring) else { return nil }

		// Get the distance to the start of the substring
		let start = distance(from: startIndex, to: range.lowerBound) as Int
		//Get the distance to the end of the substring
		let end = distance(from: startIndex, to: range.upperBound) as Int

		//length = endOfSubstring - startOfSubstring
		//start = startOfSubstring
		return NSMakeRange(start, end - start)
	}

}
