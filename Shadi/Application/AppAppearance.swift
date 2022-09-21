//
//  AppAppearance.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

final class AppAppearance {
    class func configure() {
		
		let titleTextAttributes: [NSAttributedString.Key:Any] = [
			.font            : UIFont.myMediumSystemFont(ofSize: 18),
			.foregroundColor : UIColor.white
		]
		
		let barButtonAppearance = UIBarButtonItemAppearance()
		barButtonAppearance.normal.titleTextAttributes = titleTextAttributes
		
		let image = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold))
		
		let navigationAppearance = UINavigationBarAppearance()
		navigationAppearance.backgroundColor = UIColor(named: "navigation")
		navigationAppearance.backgroundImage = nil
		navigationAppearance.shadowImage = nil
		navigationAppearance.shadowColor = nil
		navigationAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
		
		navigationAppearance.titleTextAttributes = titleTextAttributes
		navigationAppearance.buttonAppearance = barButtonAppearance
		
		UINavigationBar.appearance().standardAppearance = navigationAppearance
		UINavigationBar.appearance().compactAppearance = navigationAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
		
		if #available(iOS 15.0, *) {
			UINavigationBar.appearance().compactScrollEdgeAppearance = navigationAppearance
		}
		
		UINavigationBar.appearance().tintColor = UIColor.white
		UINavigationBar.appearance().isTranslucent = true
		
		
		let tabBarItemAppearance = UITabBarItemAppearance()
		
		tabBarItemAppearance.normal.titleTextAttributes = [.font            : UIFont.systemFont(ofSize: 13),
														   .foregroundColor : UIColor("4E5D78")]
		
		tabBarItemAppearance.selected.titleTextAttributes = [.font            : UIFont.myMediumSystemFont(ofSize: 13),
															 .foregroundColor : UIColor(named: "colorApp")!]
				
		let appearance = UITabBarAppearance()
		appearance.configureWithDefaultBackground()
		appearance.backgroundColor = .white
		appearance.shadowImage = UIImage()
		appearance.backgroundImage = UIImage()
		appearance.shadowColor = nil
		appearance.compactInlineLayoutAppearance = tabBarItemAppearance
		appearance.inlineLayoutAppearance = tabBarItemAppearance
		appearance.stackedLayoutAppearance = tabBarItemAppearance
		
		UITabBar.appearance().standardAppearance = appearance
		UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

class CustomTabBar: UITabBar {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		
	}
	
	override func sizeThatFits(_ size: CGSize) -> CGSize {
		
		let size = super.sizeThatFits(size)
		
		return CGSize(width: size.width, height: size.height + 12)
	}
}
