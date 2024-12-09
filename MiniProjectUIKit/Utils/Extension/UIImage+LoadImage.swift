//
//  UIImage+LoadImage.swift
//  MiniProjectUIKit
//
//  Created by Paulus Michael on 03/12/24.
//

import UIKit

extension UIImageView {
   func loadImage(from urlString: String) {
      guard let url = URL(string: urlString) else { return }
      
      URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
         guard let data = data, let image = UIImage(data: data) else { return }
         
         DispatchQueue.main.async {
            self?.image = image
         }
      }.resume()
   }
}
