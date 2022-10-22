//
//  QuoteListPresenter.swift


import UIKit

protocol QuoteListPresenting {
  func onViewDidLoad()
  func startFetchingQuotes()
  func showQuoteDetailController(row: Int)
}

class QuoteListPresenter: QuoteListPresenting {
  
    var quotes: [QuoteModel]?
  var router: QuoteListRouting?
  var interactor: QuoteListInteracting?
  weak var view: QuoteListViewProviding?
  
  func onViewDidLoad() {
    startFetchingQuotes()
  }
  
  func startFetchingQuotes() {
    interactor?.fetchQuotes { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let quotes):
        self.quotes = quotes
        self.view?.showQuotes(quotesArray: quotes)
      case .failure(let error):
        self.view?.showError(error.localizedDescription)
      }
    }
  }
  
  func showQuoteDetailController(row: Int) {
    guard let quote = quotes?[row] else { return }
    router?.pushToQuoteDetailScreen(quoteModel: quote)
  }
}
