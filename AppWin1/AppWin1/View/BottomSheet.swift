//
//  BottomSheet.swift
//  AppWin1
//
//  Created by yangsu.baek on 6/13/24.
//

import Foundation
import UIKit

class BottomSheet: UIView {
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!

    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()

    }

    func xibSetup() {
        guard let view = Bundle.main.loadNibNamed("BottomSheet", owner: self)?.first as? UIView else { return }

        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)

        self.roundTop()
        self.translatesAutoresizingMaskIntoConstraints = true
        self.frame = CGRect(x: 0, y: self.screenHeight, width: self.screenWidth, height: 0)
    }


    func setLabels(label: String = "설명", description: String) {
        title.text = label
        desc.text = description
    }

    func show() {
        UIView.animate(withDuration: 0.5, animations: {
            let h = ceil(self.screenHeight/2)
            self.frame = CGRect(x: 0, y: h, width: self.screenWidth, height: h)
        })
    }

    func hide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.frame = CGRect(x: 0, y: self.screenHeight, width: self.screenWidth, height: 0)
        })
    }


    @IBAction func onClickClose(_ sender: Any) {
        hide()
    }
}
