//
//  FirstVC.swift
//  ColorAPP
//
//  Created by Александр Басов on 01/10/2021.
//  Copyright © 2021 Александр Басов. All rights reserved.
//

import UIKit

protocol ColorDelegate{
    func setColor(_ color: UIColor)
}

class FirstVC: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: SecondVC = (segue.destination as? SecondVC)!
        destinationVC.colorFromMainVC = view.backgroundColor
        destinationVC.delegate = self
    }
}
extension FirstVC: ColorDelegate {
  func setColor(_ color: UIColor) {
      view.backgroundColor = color
  }
}
