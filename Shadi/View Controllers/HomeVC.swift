//
//  ViewController.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

class HomeVC: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
        navigationItem.title = "Select Car"
		registerCell()
	}

	func registerCell() {
		collectionView.registerNib(OfficeCVC.self)
		collectionView.dataSource = self
		collectionView.delegate = self
	}
}


extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueNib(OfficeCVC.self, for: indexPath)
		cell.delegate = self
		cell.isOffer = indexPath.row % 2 == 0
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: UIScreen.main.bounds.width, height: 255)
	}
}

extension HomeVC: OfficeCVCDelegate {
	func goToReservationPayment() {
		let vc = storyboard?.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
		vc.hidesBottomBarWhenPushed = true
		navigationController?.pushViewController(vc, animated: true)
	}
}
