
import UIKit

@IBDesignable
class IntrinsicTableView: UITableView {
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        #if TARGET_INTERFACE_BUILDER
        return CGSize(width: UIView.noIntrinsicMetric, height: 300)
        #else
        if contentSize.height == 0 {
            return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
        } else {
            return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
        }
        #endif
    }
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
}
