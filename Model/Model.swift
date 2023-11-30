//
//  Model.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//

import Foundation

struct MenuItem {
    let id: UUID
    let title: String
    var ingredients: [Ingredient]
    var price: Double
    var ordered: Double
    
}

extension MenuItem: Identifiable {
    var identificator: UUID {
        return id
    }
}


