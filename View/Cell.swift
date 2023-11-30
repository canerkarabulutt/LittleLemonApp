//
//  Cell.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//

import UIKit

class MenuCell: UICollectionViewCell {
    var task: MenuItem? {
        didSet { configure() }
    }
    //MARK: - Properties
    let menuNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = ""
        return label
    }()
    //MARK: - Lifecylce
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Helpers
extension MenuCell {
    private func style() {
        backgroundColor = .yellow
        layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 5
        menuNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        addSubview(menuNameLabel)
        NSLayoutConstraint.activate([
            menuNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: menuNameLabel.trailingAnchor, constant: 12),
            bottomAnchor.constraint(equalTo: menuNameLabel.bottomAnchor, constant: -26)
        ])
    }
    private func configure() {
        guard let tasks = self.task else { return }
        menuNameLabel.text = task?.title
    }
}
