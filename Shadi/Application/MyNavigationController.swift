//
//  MyNavigationController.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

class MyNavigationController: UINavigationController, UINavigationControllerDelegate {
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		delegate = self
	}
	
	func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
		viewController.navigationItem.backButtonDisplayMode = .minimal
	}
}
