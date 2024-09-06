//
//  RickMortyTableViewCell.swift
//  MVVM-ProgrammaticUI-Example
//
//  Created by Samet Korkmaz on 5.09.2024.
//

import UIKit
import Kingfisher

class RickMortyTableViewCell: UITableViewCell {

    private let customImageView: UIImageView = UIImageView()
    private let title: UILabel = UILabel()
    private let customDescription: UILabel = UILabel()
    private let saveButton: UIButton = UIButton()
    private let padingView: UIView = UIView()
    
    
    enum Identifier: String{
        case custom = "vb10"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        // Arka plan rengini ayarla
        saveButton.backgroundColor = .systemBlue
        
        // Butonun başlık metnini ayarla
     //   saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        
        // Sistem imajı olarak "person" kullan
        // Sistem imajı oluşturma ve boyutlandırma
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let largeImage = UIImage(systemName: "bookmark", withConfiguration: largeConfig)

        // Buton ayarları
        saveButton.setImage(largeImage, for: .normal)
        
        // Tint rengini ayarla (sistem imajı için)
        saveButton.tintColor = .white
        
        // Border ekleme
        saveButton.layer.borderColor = UIColor.white.cgColor
        saveButton.layer.borderWidth = 2.0
        
        // Köşeleri yuvarla
        saveButton.layer.cornerRadius = 10.0
        saveButton.clipsToBounds = true
        
        // Padding ayarla (içerik etrafındaki boşluklar)
        saveButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        // Gölge ekleme (isteğe bağlı)
        saveButton.layer.shadowColor = UIColor.black.cgColor
        saveButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        saveButton.layer.shadowOpacity = 0.5
        saveButton.layer.shadowRadius = 4.0
        
        // Button'un touch-up event'ine action ekleme
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)

        title.textAlignment = .center

        // Auto Layout kullanmak için aşağıdaki satır gereklidir
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        customDescription.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        padingView.translatesAutoresizingMaskIntoConstraints = false
        
        // contentView'e alt görünümleri ekleme
        contentView.addSubview(customImageView)
        contentView.addSubview(title)
        contentView.addSubview(customDescription)
        contentView.addSubview(saveButton)
        contentView.addSubview(padingView)
        
        NSLayoutConstraint.activate([
            
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customImageView.bottomAnchor.constraint(equalTo: padingView.topAnchor),
            customImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            // Title, customImageView'in sağında olacak
            title.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            title.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
            
            customDescription.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 16),
            customDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            customDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            customDescription.bottomAnchor.constraint(equalTo: padingView.topAnchor),
            
            saveButton.bottomAnchor.constraint(equalTo: padingView.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            saveButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1),
            saveButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25),
            
            padingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            padingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            padingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            padingView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.05)
        ])
    }
    // Butonun tıklama işlemi için bir action metodu
    @objc private func saveButtonTapped() {
        print("Save button tapped")
    }
    func cellDataModel(model: Result){
        title.text = model.name
        customDescription.text = model.created
        customImageView.kf.setImage(with: URL(string: model.image ?? ""))
    }

}

#Preview("UIKit"){
    Home_VC()
}
