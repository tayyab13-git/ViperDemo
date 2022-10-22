//
//  QuoteDetailPresenter.swift

protocol QuoteDetailPresenting {
  func onViewDidLoad()
}

class QuoteDetailPresenter {
  weak var view: QuoteDetailViewProviding?
  var quoteModel: QuoteModel
  
  init(quoteModel: QuoteModel) {
    self.quoteModel = quoteModel
  }
}

extension QuoteDetailPresenter: QuoteDetailPresenting {
  func onViewDidLoad() {
    view?.updateDetail(model: quoteModel)
  }
}
