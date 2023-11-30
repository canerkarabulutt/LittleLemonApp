//
//  MenuItemCell.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 24.10.2023.
//

import Foundation

import UIKit

class MenuItemCell: UITableViewCell {
    static let identifier = "MenuItemCell"
    
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let orderLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Hücre öğelerini yapılandırma
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        orderLabel.font = .boldSystemFont(ofSize: 20)
        orderLabel.textColor = .red
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .purple
        priceLabel.font = .boldSystemFont(ofSize: 20)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(orderLabel)
        
        // Hücre öğelerinin yerleşimini ayarlama
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            orderLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16),
            orderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
