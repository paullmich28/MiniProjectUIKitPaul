//
//  String+Height.swift
//  MiniProjectUIKit
//
//  Created by Paulus Michael on 08/12/24.
//

import UIKit

extension String {
   func height(forWidth width: CGFloat, font: UIFont) -> CGFloat {
      let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
      let boundingBox = self.boundingRect(with: constraintRect,
                                          options: .usesLineFragmentOrigin,
                                          attributes: [.font: font],
                                          context: nil)
      return ceil(boundingBox.height)
   }
}
