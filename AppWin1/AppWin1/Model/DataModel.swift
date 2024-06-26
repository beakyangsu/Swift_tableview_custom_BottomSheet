//
//  ItemModel.swift
//  AppWin1
//
//  Created by yangsu.baek on 6/13/24.
//

import Foundation


protocol DataProtocol {
    func fetchData() -> [Product]
}

final class DataModel: DataProtocol {
    func fetchData() -> [Product] {
        var products: [Product] = []

        for (i, product) in Data.products.enumerated() {
            products.append(Product(title: product, items: Data.items[i]))
        }

        return products
    }
}
