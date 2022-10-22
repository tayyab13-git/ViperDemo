//
//  QuoteDetailViewController.swift


import UIKit

protocol QuoteDetailViewProviding: AnyObject {
  func updateDetail(model: QuoteModel)
}

class QuoteDetailViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  var presenter: QuoteDetailPresenting!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
  }
}

extension QuoteDetailViewController: QuoteDetailViewProviding {
  func updateDetail(model: QuoteModel) {
    titleLabel.text = model.quote
    subtitleLabel.text = model.character
  }
}
