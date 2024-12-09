//
//  MealCollectionViewCell.swift
//  MiniProjectUIKit
//
//  Created by Paulus Michael on 08/12/24.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
   private let imageView = UIImageView()
   private let titleLabel = UILabel()
   private let areaLabel = UILabel()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      contentView.addSubview(imageView)
      contentView.addSubview(titleLabel)
      contentView.addSubview(areaLabel)
      
      imageView.contentMode = .scaleAspectFit
      
      imageView.translatesAutoresizingMaskIntoConstraints = false
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      areaLabel.translatesAutoresizingMaskIntoConstraints = false
      //
      NSLayoutConstraint.activate([
         imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
         imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
         imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
         
         titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
         titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
         titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
         
         areaLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
         areaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
         areaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
         areaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
      ])
      
      contentView.layer.borderWidth = 2
      contentView.layer.borderColor = UIColor.lightGray.cgColor
      contentView.clipsToBounds = true
      contentView.layer.cornerRadius = 8
      
      titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
      titleLabel.numberOfLines = 2
      titleLabel.textAlignment = .left
      
      areaLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
      areaLabel.textColor = .darkGray
      areaLabel.numberOfLines = 1
      areaLabel.textAlignment = .left
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   func configure(with meal: Meal) {
      titleLabel.text = meal.strMeal
      areaLabel.text = meal.strArea
      imageView.loadImage(from: meal.strMealThumb)
   }
}

