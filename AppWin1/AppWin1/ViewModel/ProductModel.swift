//
//  ViewModel.swift
//  AppWin1
//
//  Created by yangsu.baek on 6/13/24.
//

import Foundation

final class ProductModel {
    var dataModel: DataProtocol
    var products: [Product] = []

    init(dataModel: DataProtocol) {
        self.dataModel = dataModel
    }

    func getData() {
        products = dataModel.fetchData()
    }
}
