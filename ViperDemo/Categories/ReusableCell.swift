//
//  ReusableCellswift
//  


import Foundation
import UIKit

typealias ReuseableCellFromNib = ReusableCell & CellFromNib

protocol ReusableCell: Reusable {
  func update(with viewModel: Any?)
}

protocol CellFromNib: AnyObject {
  static var nibName: String { get }
  static var loadNib: UINib { get }
}

extension CellFromNib {
  static var nibName: String {
    return String(describing: self)
  }
  
  static var loadNib: UINib {
    return UINib(
      nibName: nibName,
      bundle: Bundle(for: self)
    )
  }
}
