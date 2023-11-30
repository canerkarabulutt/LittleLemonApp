//
//  MenuItemsOptionViewController.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//
import Foundation
import UIKit

class MenuItemsOptionViewController: UIViewController {
    //MARK: - Properties
    var filteredItems: [MenuItem] = []

    var tableView: UITableView!
    var viewModel: MenuViewViewModel!
    var selectedCategory: MenuCategory = .food
    var selectedSortBy: SortBy = .mostPopular
    
    private func configureTableView() {
           tableView = UITableView()
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.dataSource = self
           tableView.delegate = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: "CellIdentifier")
           view.addSubview(tableView)
       
        
        NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        }
    @objc private func categorySegmentControlValueChanged(_ sender: UISegmentedControl) {
        selectedCategory = MenuCategory.allCases[sender.selectedSegmentIndex]
        filterMenuItems()
        tableView.reloadData()
    }
    @objc private func sortBySegmentControlValueChanged(_ sender: UISegmentedControl) {
        selectedSortBy = SortBy.allCases[sender.selectedSegmentIndex]
        filterMenuItems()
        tableView.reloadData()
    }
    private func configureUI() {
           let categorySegmentedControl = UISegmentedControl(items: MenuCategory.allCases.map { $0.rawValue })
           categorySegmentedControl.selectedSegmentIndex = 0 // Varsayılan kategori seçeneği
           categorySegmentedControl.addTarget(self, action: #selector(categorySegmentControlValueChanged(_:)), for: .valueChanged)
           
           let sortSegmentedControl = UISegmentedControl(items: SortBy.allCases.map { $0.rawValue })
           sortSegmentedControl.selectedSegmentIndex = 0 // Varsayılan sıralama seçeneği
           sortSegmentedControl.addTarget(self, action: #selector(sortBySegmentControlValueChanged(_:)), for: .valueChanged)
           
           view.addSubview(categorySegmentedControl)
           view.addSubview(sortSegmentedControl)
           
           categorySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
           sortSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               categorySegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
               categorySegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               
               sortSegmentedControl.topAnchor.constraint(equalTo: categorySegmentedControl.bottomAnchor, constant: 8),
               sortSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])
           
           filterMenuItems()
           tableView.reloadData()
       
    }
    
    
    private func filterMenuItems() {

        switch selectedCategory {
        case .food:
            filteredItems = viewModel.foodMenuItems
        case .drink:
            filteredItems = viewModel.drinkMenuItems
        case .dessert:
            filteredItems = viewModel.dessertMenuItems
        case .allFood:
            filteredItems = viewModel.allMenuItems
        }

        switch selectedSortBy {
        case .mostPopular:
            filteredItems.sort { $0.ordered > $1.ordered }
        case .fromLowPrice:
            filteredItems.sort { $0.price > $1.price }
        case .fromAtoZ:
            filteredItems.sort { $0.title < $1.title }
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
}
//MARK: - Selector

//MARK: - Helpers
extension MenuItemsOptionViewController {
    private func style() {
        backgroundGradientColor()
        viewModel = MenuViewViewModel()
        configureTableView()
        configureUI()
        
    }
    private func layout() {
    }
}
extension MenuItemsOptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! MenuItemCell

            let menuItem = filteredItems[indexPath.row]
            cell.titleLabel.text = menuItem.title
            cell.priceLabel.text = "$\(menuItem.price)"
            cell.orderLabel.text = String(menuItem.ordered)
        NSLayoutConstraint.activate([
            cell.titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            cell.titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            cell.titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),

            cell.priceLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            cell.priceLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            cell.priceLabel.topAnchor.constraint(equalTo: cell.titleLabel.bottomAnchor, constant: 8),
            cell.priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: cell.contentView.bottomAnchor, constant: -8),
            
            cell.orderLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            cell.orderLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            cell.orderLabel.topAnchor.constraint(equalTo: cell.priceLabel.bottomAnchor, constant: 8),
            cell.orderLabel.bottomAnchor.constraint(lessThanOrEqualTo: cell.contentView.bottomAnchor, constant: -8),
        ])
        return cell
        
    }

}
