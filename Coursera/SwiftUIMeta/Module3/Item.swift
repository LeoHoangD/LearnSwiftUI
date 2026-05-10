//
//  Item.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 1/2/26.
//

import Foundation
import Combine

struct Item: Identifiable {
    let id = UUID()
    let name: String
}

class Model: ObservableObject {
    @Published var items: [Item]
    init(items: [Item]) {
        self.items = items
    }
    
    static func menuItems() -> [Item] {
        
        return [
            Item(name: "Lasagna"),
            Item(name: "Fettuccini Alfredo"),
            Item(name: "Spaghetti"),
            Item(name: "Avocado Toast"),
            Item(name: "Tortellini"),
            Item(name: "Pizza"),
        ]
    }
}

