//
//  DetailViewController.swift
//  MVVM-ProgrammaticUI-Example
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

class DetailViewController: UIViewController {

    private let backButton: UIButton = UIButton()
    private let titleLabel2: UILabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    

    func configure(){
        view.addSubview(backButton)
        view.addSubview(titleLabel2)
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .green
        titleLabel2.text = "Detail Screen"
        titleLabel2.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel2.textColor = .blue
        view.backgroundColor = .red

        backButton.setImage(UIImage(systemName: "arrowshape.backward"), for:.normal)
        backButton.addTarget(self, action: #selector(detailBackButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            
            titleLabel2.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 16),
            titleLabel2.topAnchor.constraint(equalTo: backButton.topAnchor),
            titleLabel2.bottomAnchor.constraint(equalTo: backButton.bottomAnchor),
            titleLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
        ])
    }
    @objc private func detailBackButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
}
