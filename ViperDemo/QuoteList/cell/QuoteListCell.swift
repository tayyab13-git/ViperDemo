//
//  QuoteListCell.swift


import UIKit

final class QuoteListCell: UITableViewCell, ReuseableCellFromNib {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var detailLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func update(with viewModel: Any?) {
    guard let viewModel = viewModel as? QuoteModel
    else { return }
    
    titleLabel.text = viewModel.quote
    detailLabel.text = viewModel.character
  }
}
