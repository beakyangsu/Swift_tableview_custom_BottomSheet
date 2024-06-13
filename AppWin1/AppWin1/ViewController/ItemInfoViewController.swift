//
//  ViewController.swift
//  AppWin1
//
//  Created by yangsu.baek on 6/12/24.
//

import UIKit

class ItemInfoViewController: UIViewController {
    var info: Item?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailView: BottomSheet!
    @IBOutlet weak var goToFirstBtn: UIButton!
    @IBOutlet weak var detailBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = info?.name ?? ""
        imageView.Circle()
        setImageView()
        detailView.setLabels(description: info?.description ?? "")

        goToFirstBtn.roundAllTips()
        detailBtn.roundAllTips()
    }

    private func setImageView() {
        if let image = info?.image {
            imageView.image = UIImage(named: image)
        }
    }

    @IBAction func onClickGoToFirst(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onClickGoToDetailInfo(_ sender: Any) {
        detailView.show()
    }
}

