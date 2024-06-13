//
//  FirstListViewController.swift
//  AppWin1
//
//  Created by yangsu.baek on 6/13/24.
//

import UIKit

class ProductListViewController: UIViewController {
    var productModel =  ProductModel(dataModel: DataModel())

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "품목"

        productModel.getData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "itemSegue") {
            let secondView = segue.destination as! ItemListViewController
            let object = sender as! [String: Any?]
            secondView.items = object["items"] as? [Item]
            secondView.pageTitle = object["pageTitle"] as? String
        }
    }
}


extension ProductListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModel.products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension ProductListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "labelcell", for: indexPath) as! LabelCell
        cell.label.text = productModel.products[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = productModel.products[indexPath.row].title
        let items = productModel.products[indexPath.row].items
        performSegue(withIdentifier: "itemSegue", sender: ["items": items, "pageTitle": title])
    }
}
