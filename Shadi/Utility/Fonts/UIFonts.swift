//
//  AppFontName.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

struct AppFontName {
    static let light    = "HaniArb-Light"
    static let regular  = "HaniArb-Regular"
    static let medium   = "HaniArb-SemiBold"
    static let bold     = "HaniArb-Bold"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }
        
    @objc class func myMediumSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.medium, size: size)!
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
		print("fontAttribute \(fontAttribute)")
        switch fontAttribute {
            case "CTFontRegularUsage": // Regular
                fontName = AppFontName.regular
				
			case "CTFontMediumUsage": // Medium
				fontName = AppFontName.medium
				
			case "CTFontDemiUsage": // SemiBold
				fontName = AppFontName.medium
				
            case "CTFontBoldUsage": // Bold
                fontName = AppFontName.bold
				
            default:
                fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
                
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
