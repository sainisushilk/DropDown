//
//  UIView+Constraints.swift
//  DropDown
//
//  Created by Kevin Hirsch on 28/07/15.
//  Copyright (c) 2015 Kevin Hirsch. All rights reserved.
//

#if os(iOS)

import UIKit

//MARK: - Constraints

internal extension UIView {
	
	func addConstraints(format: String, options: NSLayoutConstraint.FormatOptions = [], metrics: [String: AnyObject]? = nil, views: [String: UIView]) {
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: metrics, views: views))
	}
	
	func addUniversalConstraints(format: String, options: NSLayoutConstraint.FormatOptions = [], metrics: [String: AnyObject]? = nil, views: [String: UIView]) {
		addConstraints(format: "H:\(format)", options: options, metrics: metrics, views: views)
		addConstraints(format: "V:\(format)", options: options, metrics: metrics, views: views)
	}
	
}



//MARK: - Bounds

internal extension UIView {
	
	var windowFrame: CGRect? {
		return superview?.convert(frame, to: nil)
	}
	
}

internal extension UIWindow {
    
    static func visibleWindow() -> UIWindow? {
        // iOS 13+
        if #available(iOS 13.0, *) {
            return UIApplication.shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        } else {
            // iOS 12 and earlier
            return UIApplication.shared.keyWindow
        }
    }
}


#endif
