//
//  QuoteListBuilder.swift


import UIKit

final class QuoteListBuilder {
  static func buildModule() -> UIViewController {
    
    let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "QuoteListViewController") as! QuoteListViewController
      
    let parser = ParseHandler()
    let apiClient = APIClient(parser: parser)
    let quoteClient = QuoteClient(apiClient: apiClient)
    let interactor = QuoteListInteractor(quoteClient: quoteClient)
    let router = QuoteListRouter()
    let presenter = QuoteListPresenter()
    
    presenter.router = router
    presenter.interactor = interactor
    presenter.view = view
    
    router.viewController = view
    view.presenter = presenter
    return view
  }
}
