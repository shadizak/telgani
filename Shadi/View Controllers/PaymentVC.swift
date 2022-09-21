//
//  ViewController.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

class PaymentVC: UIViewController {
	
	@IBOutlet weak var paymentTableView: UITableView!
	@IBOutlet weak var bookButton: UIButton!
	
	let models: [PaymentModel] = [
		PaymentModel(status: "Paid", statusTextColor: UIColor("05944F"), statusBackColor: UIColor("E2F4EC"), isPaid: true),
		PaymentModel(status: "Paid", statusTextColor: UIColor("05944F"), statusBackColor: UIColor("E2F4EC"), isPaid: true),
		PaymentModel(status: "Paid", statusTextColor: UIColor("05944F"), statusBackColor: UIColor("E2F4EC"), isPaid: true),
		PaymentModel(status: "DUE IN 15 DAYS", statusTextColor: UIColor("FF9A3D"), statusBackColor: UIColor("FFFBF2"), isPaid: false),
		PaymentModel(status: "DUE IN 15 DAYS", statusTextColor: UIColor("FF9A3D"), statusBackColor: UIColor("FFFBF2"), isPaid: false),
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		let label = UILabel(frame: navigationController!.navigationBar.frame)
		label.text = "  Reservation Details"
		label.font = UIFont.myMediumSystemFont(ofSize: 18)
		label.textColor = UIColor.white
		label.textAlignment = .left
		
		navigationItem.titleView = label
		
		initializationTableView()
		
		
		let action1 = UIAction(title: "Extend") { _ in }
		let action2 = UIAction(title: "Cancel") { _ in }
		
		let menu = UIMenu(children: [action1, action2])
		
		bookButton.menu = menu
		bookButton.showsMenuAsPrimaryAction = true
	}
}

extension PaymentVC: UITableViewDelegate, UITableViewDataSource {
	func initializationTableView() {
		paymentTableView.registerNib(ReservationDetailsCell.self)
		paymentTableView.allowsMultipleSelection = true
		paymentTableView.dataSource = self
		paymentTableView.dataSource = self
		paymentTableView.selectRow(at: IndexPath(row: 3, section: 0), animated: false, scrollPosition: .none)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueNib(ReservationDetailsCell.self, for: indexPath)
		cell.setData(model: models[indexPath.row])
		return cell
	}

	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		return models[indexPath.row].isPaid ? nil : indexPath
	}
}
