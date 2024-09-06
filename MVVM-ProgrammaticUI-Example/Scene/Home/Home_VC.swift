//
//  Home_VC.swift
//  MVVM-ProgrammaticUI-Example
//
//  Created by Samet Korkmaz on 5.09.2024.
//
import SwiftUI
import UIKit

protocol HomeViewInterface: AnyObject{
    func configurePage()
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}

final class Home_VC: UIViewController {
    let labelTitle: UILabel = UILabel()
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let tableView: UITableView = UITableView()
    
    private lazy var results: [Result] = []
    private lazy var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RickMortyTableViewCell.self, forCellReuseIdentifier: RickMortyTableViewCell.Identifier.custom.rawValue)
        viewModel.viewDidLoad()
    }
    
}

extension Home_VC: HomeViewInterface{
    func configurePage() {
        view.addSubview(labelTitle)
        view.addSubview(indicator)
        view.addSubview(tableView)
        drawDesing()
        configureLayouts()
    }
    
    private func drawDesing(){
        // View
        view.backgroundColor = .white
        // TitleLabel
        labelTitle.text = viewModel.homeLabelText
        labelTitle.textColor = .black
        labelTitle.textAlignment = .center
        labelTitle.font = .systemFont(ofSize: 24, weight: .bold)
        // Indicator
        indicator.startAnimating()
        indicator.backgroundColor = .blue
        indicator.color = .white
        
        // TableView
        tableView.backgroundColor = .white
    }
    
    private func configureLayouts(){
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: labelTitle.topAnchor),
            indicator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            indicator.heightAnchor.constraint(equalTo: labelTitle.heightAnchor),
            indicator.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2)
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: indicator.trailingAnchor),
            // box.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }
}
// --MARK: TABLEVIEW
extension Home_VC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RickMortyTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickMortyTableViewCell.Identifier.custom.rawValue) as?  RickMortyTableViewCell else {
            return UITableViewCell()
        }

        cell.cellDataModel(model: results[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.modalPresentationStyle = .fullScreen // Sayfayı tam ekran olarak sunma (opsiyonel)
        present(detailVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10 // Satırlar arasına 10px boşluk ekle
    }


}


#Preview("UIKit"){
    Home_VC()
}
