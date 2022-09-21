//
//  ReservationDetailsCell.swift
//  Shadi
//
//  Created by Shadi Zaqout on 19/09/2022.
//

import UIKit

class ReservationDetailsCell: UITableViewCell {

    @IBOutlet weak var imageStatus: UIImageView!
    @IBOutlet weak var viewStatusColor: UIView!
    @IBOutlet weak var statusText: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		selectionStyle = .none
    }

    func setData(model: PaymentModel) {
		statusText.text = model.status
		statusText.textColor = model.statusTextColor
		statusText.superview?.backgroundColor = model.statusBackColor
		
		if model.isPaid {
			imageStatus.image = UIImage(named: "done.svg")
			isUserInteractionEnabled = false
		}
    }
	
	override func updateConfiguration(using state: UICellConfigurationState) {
		super.updateConfiguration(using: state)
		
		if !state.isDisabled {
			imageStatus.image = state.isSelected ? UIImage(named: "selected.svg") : UIImage(named: "unnSelected.svg")
		}
	}
}
