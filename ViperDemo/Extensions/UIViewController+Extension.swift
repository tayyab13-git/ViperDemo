//
//  UIViewController+Extensions.swift
//Qutoe App Demo

import UIKit

extension UIViewController {
  func showAlert(with title:String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}
