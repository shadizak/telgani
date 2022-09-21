//
//  UICollectionView.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

extension UICollectionView {
	var selectedItems: [IndexPath] {
		return indexPathsForSelectedItems ?? []
    }
}

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(_ cell: T.Type) {
        register(UINib(nibName: String(describing: cell), bundle: nil), forCellWithReuseIdentifier: String(describing: cell))
    }
    
	func dequeueNib<T: UICollectionViewCell>(_ nib: T.Type, for indexPath: IndexPath) -> T {
		return dequeueReusableCell(withReuseIdentifier: String(describing: nib), for: indexPath) as! T
	}
	
	func registerReusableView<T: UICollectionReusableView>(_ view: T.Type, kind: String) {
        register(view, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: view))
    }
    
	func dequeueReusableView<T: UICollectionReusableView>(_ view: T.Type, kind: String, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: view), for: indexPath) as! T
    }
}


extension UITableView {
	func registerNib<T: UITableViewCell>(_ cell: T.Type) {
		register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: String(describing: cell))
	}
	
	func dequeueNib<T: UITableViewCell>(_ nib: T.Type, for indexPath: IndexPath) -> T {
		return dequeueReusableCell(withIdentifier: String(describing: nib), for: indexPath) as! T
	}
}
