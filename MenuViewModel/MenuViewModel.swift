//
//  MenuViewModel.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//

import UIKit


class MenuViewViewModel {
    
    var foodMenuItems: [MenuItem] = []
    var drinkMenuItems: [MenuItem] = []
    var dessertMenuItems: [MenuItem] = []
    var allMenuItems: [MenuItem] = []
    init() {
            foodMenuItems = foodItems
            drinkMenuItems = drinkItems
            dessertMenuItems = dessertItems
            allMenuItems = foodItems + drinkItems + dessertItems
        }

}
let foodItems: [MenuItem] = [
    MenuItem(id: UUID(), title: "Pasta with Tomato Sauce", ingredients: [.Pasta, .TomatoSauce], price: 30.00, ordered: 25.0),
    MenuItem(id: UUID(), title: "Food 2", ingredients: [.Carrot, .Broccoli], price: 10.00, ordered: 20.0),
    MenuItem(id: UUID(), title: "Food 3", ingredients: [.Spinach, .Broccoli], price: 12.00, ordered: 18.0),
    MenuItem(id: UUID(), title: "Food 4", ingredients: [.Carrot, .Spinach], price: 22.00, ordered: 14.0),
    MenuItem(id: UUID(), title: "Food 5", ingredients: [.TomatoSauce, .Broccoli], price: 22.00, ordered: 11.0),
    MenuItem(id: UUID(), title: "Food 6", ingredients: [.Carrot, .Pasta], price: 27.00, ordered: 4.0),
    MenuItem(id: UUID(), title: "Food 7", ingredients: [.Carrot, .Broccoli], price: 24.00, ordered: 2.0),
    MenuItem(id: UUID(), title: "Food 8", ingredients: [.Pasta, .Broccoli], price: 32.00, ordered: 7.0),
    MenuItem(id: UUID(), title: "Food 9", ingredients: [.Carrot, .TomatoSauce], price: 29.00, ordered: 15.0),
    MenuItem(id: UUID(), title: "Food 10", ingredients: [.Carrot, .Spinach], price: 40.00, ordered: 3.0),
    MenuItem(id: UUID(), title: "Food 11", ingredients: [.Pasta, .Broccoli], price: 42.00, ordered: 10.0),
    MenuItem(id: UUID(), title: "Food 12", ingredients: [.Broccoli, .TomatoSauce], price: 52.00, ordered: 1.0),


]

let drinkItems: [MenuItem] = [
    MenuItem(id: UUID(), title: "Orange Juice", ingredients: [.Orange], price: 10.00, ordered: 19.0),
    MenuItem(id: UUID(), title: "Tomato Juice", ingredients: [.TomatoSauce], price: 9.00, ordered: 12.0),
    MenuItem(id: UUID(), title: "Carrot Juice", ingredients: [.Carrot], price: 11.00, ordered: 6.0),
    MenuItem(id: UUID(), title: "Orange Juice", ingredients: [.Orange], price: 15.00, ordered: 3.0),
    MenuItem(id: UUID(), title: "Orange Juice", ingredients: [.Orange], price: 12.00, ordered: 1.0),
    MenuItem(id: UUID(), title: "Orange Juice", ingredients: [.Orange], price: 20.00, ordered: 5.0),
    MenuItem(id: UUID(), title: "Orange Juice", ingredients: [.Orange], price: 160.00, ordered: 1.0),
    MenuItem(id: UUID(), title: "Orange Juice", ingredients: [.Orange], price: 30.00, ordered: 9.0),

    
]

let dessertItems: [MenuItem] = [
    MenuItem(id: UUID(), title: "Chocolate Cake", ingredients: [.Chocolate], price: 20.00, ordered: 1.0),
    MenuItem(id: UUID(), title: "Spinach Cake", ingredients: [.Spinach], price: 20.00, ordered: 3.0),

]

