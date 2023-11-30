//
//  CustomLabel.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//

import UIKit

//MENU LABEL
class CustomMenuLabel: UILabel {
    init(label: UILabel) {
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dividerView)
        dividerView.backgroundColor = .white
        dividerView.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 40),
            label.widthAnchor.constraint(equalToConstant: 120),
            
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class CustomSectionHeaderView: UICollectionReusableView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow // Başlık metni rengini ayarlayın
        label.font = UIFont.boldSystemFont(ofSize: 30)// Başlık metni fontunu ayarlayın
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Başlık görünümünün tasarımı burada yapılabilir.
        // Örneğin, başlık etrafında bir arka plan rengi veya çizgi eklemek isterseniz burada ekleyebilirsiniz.
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        NSLayoutConstraint.activate([
            dividerView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
