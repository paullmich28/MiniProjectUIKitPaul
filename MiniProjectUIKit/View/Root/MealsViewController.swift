//
//  CollectionViewController.swift
//  MiniProjectUIKit
//
//  Created by Paulus Michael on 04/12/24.
//

import UIKit

class MealsViewController: UIViewController {
   private let titleLabel = UILabel()
   private let searchBar = UISearchBar()
   private let scrollView = UIScrollView()
   
   public let variables = Variables()
   public let api = APIResponse()
   public let defaultLabel = UILabel()
   public var collectionView: UICollectionView?
   public var meals: [Meal] = []
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      
      setupLabel()
      setupSearchBar()
      setupScrollView()
      setupCollectionView()
      setupDefaultValue()
      setupConstraints()
   }
   
   private func setupCollectionView() {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      layout.minimumInteritemSpacing = 10
      layout.minimumLineSpacing = 20
      layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      
      let itemWidth = (view.frame.size.width - 30) / 2
      layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
      
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.backgroundColor = .white
      collectionView.delegate = self
      collectionView.dataSource = self
      
      // Register cell
      collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
      
      self.collectionView = collectionView
      
      if let collectionView = self.collectionView {
         view.addSubview(collectionView)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
      }
   }
   
   func setupDefaultValue(){
      defaultLabel.text = variables.defaultString
      defaultLabel.textAlignment = .center
      defaultLabel.textColor = .gray
      defaultLabel.font = .systemFont(ofSize: 16, weight: .regular)
      defaultLabel.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(defaultLabel)
   }
   
   func setupScrollView(){
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      scrollView.showsHorizontalScrollIndicator = true
      scrollView.isPagingEnabled = false
      view.addSubview(scrollView)
      
      let contentView = UIView()
      contentView.translatesAutoresizingMaskIntoConstraints = false
      scrollView.addSubview(contentView)
      
      // Set content size for horizontal scrolling
      NSLayoutConstraint.activate([
         contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
         contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
         contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
         contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
         contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
      ])
      
      // Add buttons inside the container view
      let buttonTitles = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5"]
      var previousButton: UIButton? = nil
      let buttonSpacing: CGFloat = 16.0
      
      for title in buttonTitles {
         // Create each button
         let button = UIButton(type: .system)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setTitle(title, for: .normal)
         button.setTitleColor(.black, for: .normal)
         button.backgroundColor = .systemGreen
         button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
         button.layer.cornerRadius = 8
         //         button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
         
         contentView.addSubview(button)
         
         NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            button.widthAnchor.constraint(greaterThanOrEqualToConstant: 75)// Width of each button
         ])
         
         if let previous = previousButton {
            NSLayoutConstraint.activate([
               button.leftAnchor.constraint(equalTo: previous.rightAnchor, constant: buttonSpacing)
            ])
         } else {
            NSLayoutConstraint.activate([
               button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: buttonSpacing)
            ])
         }
         
         previousButton = button
      }
      
      if let lastButton = previousButton {
         NSLayoutConstraint.activate([
            lastButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -buttonSpacing)
         ])
      }
   }
   
   func setupLabel(){
      view.addSubview(titleLabel)
      
      titleLabel.text = variables.title
      titleLabel.textColor = .label
      titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
      titleLabel.textAlignment = .center
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
   }
   
   func setupSearchBar(){
      view.addSubview(searchBar)
      
      searchBar.keyboardType = .default
      searchBar.searchBarStyle = .minimal
      searchBar.placeholder = variables.searchPlaceholder
      searchBar.delegate = self
      
      searchBar.translatesAutoresizingMaskIntoConstraints = false
   }
   
   func setupConstraints(){
      NSLayoutConstraint.activate([
         titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         titleLabel.bottomAnchor.constraint(equalTo: searchBar.topAnchor),
         
         searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
         searchBar.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16),
         searchBar.bottomAnchor.constraint(equalTo: scrollView.topAnchor),
         
         scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
         scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         scrollView.heightAnchor.constraint(equalToConstant: 40),
         
         defaultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         defaultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         defaultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
         defaultLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16)
      ])
   }
}
