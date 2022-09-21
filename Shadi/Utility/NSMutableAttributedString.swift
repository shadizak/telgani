//
//  NSMutableAttributedString.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

extension NSMutableAttributedString {
	func withUnderLine() -> NSMutableAttributedString {
		addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: length))
		return self
	}
	
	func withStrikethrough(color: String) -> NSMutableAttributedString {
		addAttribute(.strikethroughStyle, value: NSUnderlineStyle.double.rawValue, range: NSRange(location: 0, length: length))
		addAttribute(.strikethroughColor, value: UIColor(color), range: NSRange(location: 0, length: length))
		return self
	}
	
	func with(font: UIFont) -> NSMutableAttributedString {
		addAttributes([.font : font], range: NSRange(location: 0, length: length))
		return self
	}
	
	func with(backgroundColor: UIColor) -> NSMutableAttributedString {
		addAttributes([.backgroundColor : backgroundColor], range: NSRange(location: 0, length: length))
		return self
	}
	
	func with(attributes: [NSAttributedString.Key:Any]) -> NSMutableAttributedString {
		addAttributes(attributes, range: NSRange(location: 0, length: length))
		return self
	}
	
	func with(textColor: UIColor) -> NSMutableAttributedString {
		addAttributes([.foregroundColor : textColor], range: NSRange(location: 0, length: length))
		return self
	}
	
	func with(textColor: String) -> NSMutableAttributedString {
		addAttributes([.foregroundColor : UIColor(textColor)], range: NSRange(location: 0, length: length))
		return self
	}
	
	func with(paragraphStyle: NSMutableParagraphStyle) -> NSMutableAttributedString {
		addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
		return self
	}
	
	func with(alignment: NSTextAlignment) -> NSMutableAttributedString {
		var hasCurrentStyle = false
		
		self.enumerateAttribute(NSAttributedString.Key.paragraphStyle, in: NSRange(location: 0, length: self.length), options: .longestEffectiveRangeNotRequired) { attribute, range, stop in
			if let attribute = attribute as? NSMutableParagraphStyle {
				attribute.alignment = alignment
				hasCurrentStyle = true
			}
		}
		
		if !hasCurrentStyle {
			let paragraphStyle = NSMutableParagraphStyle()
			paragraphStyle.alignment = alignment
			addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
		}
		
		return self
	}
	
	func with(lineHeightMultiple: CGFloat, font: UIFont) -> NSMutableAttributedString {
		let offset = font.capHeight - (font.capHeight * lineHeightMultiple)
		
		var hasCurrentStyle = false
		
		self.enumerateAttribute(NSAttributedString.Key.paragraphStyle, in: NSRange(location: 0, length: self.length), options: .longestEffectiveRangeNotRequired) { attribute, range, stop in
			if let attribute = attribute as? NSMutableParagraphStyle {
				attribute.lineHeightMultiple = lineHeightMultiple
				hasCurrentStyle = true
			}
		}
		
		if !hasCurrentStyle {
			let style = NSMutableParagraphStyle()
			style.lineHeightMultiple = lineHeightMultiple
			addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: length))
		}
		
		
		return with(baseLine: -offset)
	}
	
	func with(lineHeightMultiple: CGFloat) -> NSMutableAttributedString {
		var hasCurrentStyle = false
		
		self.enumerateAttribute(NSAttributedString.Key.paragraphStyle, in: NSRange(location: 0, length: self.length), options: .longestEffectiveRangeNotRequired) { attribute, range, stop in
			if let attribute = attribute as? NSMutableParagraphStyle {
				attribute.lineHeightMultiple = lineHeightMultiple
				hasCurrentStyle = true
			}
		}
		
		if !hasCurrentStyle {
			let style = NSMutableParagraphStyle()
			style.lineHeightMultiple = lineHeightMultiple
			addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: length))
		}
		
		return self
	}
	
	func with(baseLine: CGFloat) -> Self {
		addAttribute(.baselineOffset, value: baseLine, range: NSRange(location: 0, length: length))
		return self
	}
	
	func with(baseWritingDirection: NSWritingDirection) -> NSMutableAttributedString {
		var hasCurrentStyle = false
		
		self.enumerateAttribute(NSAttributedString.Key.paragraphStyle, in: NSRange(location: 0, length: self.length), options: .longestEffectiveRangeNotRequired) { attribute, range, stop in
			if let attribute = attribute as? NSMutableParagraphStyle {
				attribute.baseWritingDirection = baseWritingDirection
				hasCurrentStyle = true
			}
		}
		
		if !hasCurrentStyle {
			let style = NSMutableParagraphStyle()
			style.baseWritingDirection = baseWritingDirection
			addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: length))
		}
		
		return self
	}
	
	func with(lineSpacing: CGFloat) -> NSMutableAttributedString {
		var hasCurrentStyle = false
		
		self.enumerateAttribute(NSAttributedString.Key.paragraphStyle, in: NSRange(location: 0, length: self.length), options: .longestEffectiveRangeNotRequired) { attribute, range, stop in
			if let attribute = attribute as? NSMutableParagraphStyle {
				attribute.lineSpacing = lineSpacing
				hasCurrentStyle = true
			}
		}
		
		if !hasCurrentStyle {
			let style = NSMutableParagraphStyle()
			style.lineSpacing = lineSpacing
			addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: length))
		}
		
		return self
	}
}
