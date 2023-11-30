//
//  MenuItemDetailsViewController.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//
import Foundation
import UIKit

class MenuItemDetailsViewController: UIViewController {
    let menuItem: MenuItem
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Properties
    
    private var stackView = UIStackView()
    
    //Values
    private let priceValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let orderedValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let ingredientValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    //Title
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .purple
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let orderedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let ingredientLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let menuImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Little Lemon logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
}
//MARK: - Helpers
extension MenuItemDetailsViewController {
    private func style() {
        backgroundGradientColor()
        
        stackView = UIStackView(arrangedSubviews: [titleLabel ,priceLabel, priceValueLabel, orderedLabel, orderedValueLabel, ingredientLabel, ingredientValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        orderedLabel.translatesAutoresizingMaskIntoConstraints = false
        orderedValueLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = menuItem.title
        priceLabel.text = "Price :"
        priceValueLabel.text = String(menuItem.price)
        orderedLabel.text = "Ordered :"
        orderedValueLabel.text = String(menuItem.ordered)
        ingredientLabel.text = "Ingredients :"
        let ingredientStrings = menuItem.ingredients.map { $0.rawValue }
        ingredientValueLabel.text = ingredientStrings.joined()
        ingredientValueLabel.numberOfLines = 0
        let ingredientText = ingredientStrings.joined(separator: "\n")
        ingredientValueLabel.text = ingredientText

    }
    private func layout() {
        view.addSubview(menuImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            menuImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            menuImageView.heightAnchor.constraint(equalToConstant: 400),
            menuImageView.widthAnchor.constraint(equalToConstant: 400),
            menuImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
