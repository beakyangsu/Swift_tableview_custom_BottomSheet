//
//  DetailListViewController.swift
//  AppWin1
//
//  Created by yangsu.baek on 6/13/24.
//

import UIKit

class ItemListViewController: UIViewController {
    var pageTitle: String?
    var items: [Item]?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = pageTitle ?? ""

        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "infoSegue") {
            let secondView = segue.destination as! ItemInfoViewController
            let object = sender as! [String: Any?]
            secondView.info = object["info"] as? Item
        }
    }
}


extension ItemListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension ItemListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "labelcell", for: indexPath) as! LabelCell
        cell.label.text = items?[indexPath.row].name ?? ""
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = items?[indexPath.row]
        performSegue(withIdentifier: "infoSegue", sender: ["info": info])
    }
}
