//
//  MenuItemProtocol.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var title: String { get }
    var ingredients: [Ingredient] { get set }
    var price: Double { get }
    var ordered: Double { get }

}

extension MenuItem: MenuItemProtocol {
    
}
