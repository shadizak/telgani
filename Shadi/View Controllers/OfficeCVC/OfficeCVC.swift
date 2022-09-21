//
//  OfficeCVC.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

protocol OfficeCVCDelegate: AnyObject {
	func goToReservationPayment()
}

class OfficeCVC: UICollectionViewCell {

	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var pageControl: UIPageControl!

	var isOffer: Bool = false
	
	weak var delegate: OfficeCVCDelegate?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		contentView.subviews[0].translatesAutoresizingMaskIntoConstraints = false
		contentView.subviews[0].widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
		
		registerCell()
		
		pageControl.numberOfPages = 5
		
		for dot in pageControl.subviews {
			dot.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
		}
		
		let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(190))
		let item = NSCollectionLayoutItem(layoutSize: size)
		
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
		group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
		
		let section = NSCollectionLayoutSection(group: group)
		section.orthogonalScrollingBehavior = .groupPagingCentered
		section.interGroupSpacing = 10
		
		let flow = UICollectionViewCompositionalLayout(section: section)

		collectionView.collectionViewLayout = flow
    }
	
	func registerCell() {
		collectionView.registerNib(OfferCVC.self)
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
	}
	
	@IBAction func previous(_ sender: Any) {
		let currentIndex = collectionView.indexPathsForSelectedItems?.first?.row ?? 0
		let previousIndex = currentIndex - 1
		
		let indexPath: IndexPath
		
		if previousIndex < 0 {
			indexPath = IndexPath(row: collectionView.numberOfItems(inSection: 0) - 1, section: 0)
		} else {
			indexPath = IndexPath(row: previousIndex, section: 0)
		}
		
		collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
		pageControl.currentPage = indexPath.row
	}
	
	@IBAction func next(_ sender: Any) {
		let currentIndex = collectionView.indexPathsForSelectedItems?.first?.row ?? 0
		let nextIndex = currentIndex + 1
		
		let indexPath: IndexPath
		
		if nextIndex >= collectionView.numberOfItems(inSection: 0) {
			indexPath = IndexPath(row: 0, section: 0)
		} else {
			indexPath = IndexPath(row: nextIndex, section: 0)
		}
		
		collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
		pageControl.currentPage = indexPath.row
	}
}

extension OfficeCVC: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueNib(OfferCVC.self, for: indexPath)
		cell.specialOfferView.isHidden = !isOffer
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
		pageControl.currentPage = indexPath.row
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		delegate?.goToReservationPayment()
	}
}
