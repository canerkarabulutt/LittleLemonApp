//
//  ViewController.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//
import Foundation
import UIKit

private let reuseIdentifier = "MenuCell"

class MenuItemsViewController: UIViewController {
    
    
    
    //MARK: - Properties
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Little Lemon logo")
        return imageView
    }()
    private lazy var menuContainerView: UIView = {
        let containerView = CustomMenuLabel(label: menuLabel)
        return containerView
    }()
    private let menuLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "MENU", attributes: [.foregroundColor: UIColor.black, .font: UIFont.preferredFont(forTextStyle: .largeTitle)])
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    private var stackView = UIStackView()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
              layout.scrollDirection = .vertical
              layout.minimumInteritemSpacing = 4
              layout.minimumLineSpacing = 20
              let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
              collectionView.backgroundColor = .clear
              collectionView.isScrollEnabled = true
              return collectionView
    }()
    
    private lazy var switchToOptionPage: UIButton = {
        let button = UIButton(type: .system)
        let systemImage = UIImage(systemName: "line.3.horizontal.decrease.circle")
        button.setImage(systemImage, for: .normal)
        button.tintColor = UIColor.black
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(handleGoOptionPage), for: .touchUpInside)
        return button
    }()
    var viewModel: MenuViewViewModel = MenuViewViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
//MARK: - Selector
extension MenuItemsViewController {
    @objc func handleGoOptionPage(_ sender: UIButton) {
        let controller = MenuItemsOptionViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - Helpers
extension MenuItemsViewController {

    private func style() {
        backgroundGradientColor()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView = UIStackView(arrangedSubviews: [menuContainerView])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        switchToOptionPage.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    private func layout() {
        view.addSubview(collectionView)
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        view.addSubview(switchToOptionPage)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.widthAnchor.constraint(equalToConstant: 120),
            
            switchToOptionPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            switchToOptionPage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: menuLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),


        ])
    }
}
extension MenuItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let selectedItem: MenuItem

               switch indexPath.section {
               case 0:
                   selectedItem = viewModel.foodMenuItems[indexPath.row]
               case 1:
                   selectedItem = viewModel.drinkMenuItems[indexPath.row]
               case 2:
                   selectedItem = viewModel.dessertMenuItems[indexPath.row]
               default:
                   return
               }
        showDetailPage(for: selectedItem)
        print(selectedItem)
    }
    func showDetailPage(for menuItem: MenuItem) {

        let detailViewController = MenuItemDetailsViewController(menuItem: menuItem)
        navigationController?.pushViewController(detailViewController, animated: true)
        }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomSectionHeaderView
            
            // Bölüm başlığını belirleyin
            if indexPath.section == 0 {
                headerView.titleLabel.text = "FOOD"
            } else if indexPath.section == 1 {
                headerView.titleLabel.text = "DRINK"
            } else if indexPath.section == 2 {
                headerView.titleLabel.text = "DESSERT"
            }
            
            return headerView
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
               return 12
           } else if section == 1 {
               return 8
           } else if section == 2 {
               return 2
           } else {
               return 0
           }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCell
            cell.menuNameLabel.font = .boldSystemFont(ofSize: 16)
            cell.menuNameLabel.text = "Food \(indexPath.row + 1)"
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCell
            cell.menuNameLabel.font = .boldSystemFont(ofSize: 16)
            cell.menuNameLabel.text = "Drink \(indexPath.row + 1)"
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCell
            cell.menuNameLabel.font = .boldSystemFont(ofSize: 16)
            cell.menuNameLabel.text = "Dessert \(indexPath.row + 1)"
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}

extension MenuItemsViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 80) 
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 30
        } else if section == 1 {
            return 30
        } else if section == 2 {
            return 30
        } else {
            return 30
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
                    return UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
                } else if section == 1 {
                    return UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
                } else if section == 2 {
                    return UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
                } else {
                    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
    }
    
}
