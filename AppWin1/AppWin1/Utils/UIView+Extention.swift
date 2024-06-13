//
//  UIView+Extention.swift
//  AppWin1
//
//  Created by yangsu.baek on 6/13/24.
//

import Foundation
import UIKit

extension UIView {
    func roundAllTips() {
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.clipsToBounds = true
    }

    func Circle() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        self.clipsToBounds = true
    }

    func roundTop() {
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.clipsToBounds = true
    }
}
