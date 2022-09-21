
import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var corner: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var border: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            let color = (layer.borderColor) ?? UIColor.clear.cgColor
            return UIColor(cgColor: color) 
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor {
        get {
            let color = (layer.shadowColor) ?? UIColor.clear.cgColor
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGFloat {
        get {
            return layer.shadowOffset.height
        }
        set {
            layer.shadowOffset = CGSize(width: 0, height: newValue)
        }
    }
}
