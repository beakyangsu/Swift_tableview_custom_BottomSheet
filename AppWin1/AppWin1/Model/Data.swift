//
//  Datas.swift
//  AppWin1
//
//  Created by yangsu.baek on 6/13/24.
//

import Foundation


struct Data {
    static let products: [String] = ["동물", "과일", "야구"]
    static let items: [[Item]] = [
        [Item(name: "사자", image: "rion", description: "사자입니다."), Item(name: "강아지", image: "dog", description: "강아지입니다."),
         Item(name: "고양이", image: "cat", description: "고양이입니다.")],
        [Item(name: "사과", image: "apple", description: "사과입니다."), Item(name: "오렌지", image: "orange", description: "오렌지입니다."),
         Item(name: "메론", image: "melon", description: "메론입니다.")],
        [Item(name: "한화이글스", image: "hanhwa", description: "최강한화."), Item(name: "두산베어스", image: "dusan", description: "두산베어스입니다."),
         Item(name: "키움히어로즈", image: "kium", description: "키움히어로즈입니다.")]
    ]
}
