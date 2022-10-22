//
//  QuoteListRouter.swift


import UIKit

protocol QuoteListRouting {
  func pushToQuoteDetailScreen(quoteModel: QuoteModel)
}

class QuoteListRouter {
  weak var viewController: UIViewController?
}

extension QuoteListRouter: QuoteListRouting {
  func pushToQuoteDetailScreen(quoteModel: QuoteModel) {
    let quoteDetailModule = QuoteDetailBuilder.buildModule(with: quoteModel)
    viewController?.navigationController?.pushViewController(quoteDetailModule, animated: true)
  }
}
