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

    private var isShow = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        isShow ? setshowFrame() : sethideFrame()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        isShow ? setshowFrame() : sethideFrame()
    }

    private func xibSetup() {
        guard let view = Bundle.main.loadNibNamed("BottomSheet", owner: self)?.first as? UIView else { return }

        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)

        self.roundTop()
        self.translatesAutoresizingMaskIntoConstraints = true

        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        let h = ceil(screenHeight/2)
        self.frame.size = CGSize(width: screenWidth, height: h)
        self.frame.origin = CGPoint(x: 0, y: screenHeight)

    }

    private func setshowFrame() {
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        let h = ceil(screenHeight/2)
        self.frame = CGRect(x: 0, y: h, width: screenWidth, height: h)
    }

    private func sethideFrame() {
        let screenHeight = UIScreen.main.bounds.size.height
        self.frame.origin = CGPoint(x: 0, y: screenHeight)
    }

    func setLabels(label: String = "설명", description: String) {
        title.text = label
        desc.text = description
    }

    func show() {
        isShow = true
        UIView.animate(withDuration: 0.5, animations: {
            self.setshowFrame()
        })
    }

    func hide() {
        isShow = false
        UIView.animate(withDuration: 0.5, animations: {
            self.sethideFrame()
        })
    }


    @IBAction func onClickClose(_ sender: Any) {
        hide()
    }
}
