//
//  QuoteDetailBuilderswift


import UIKit

final class QuoteDetailBuilder {
  static func buildModule(with quoteModel: QuoteModel) -> UIViewController {
   //syntax of declaring storyBoard
      let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "QuoteDetailViewController") as! QuoteDetailViewController
    
      //finish here
      //we always use storyboard in builder to recreate and re build our app's view
      
    let presenter = QuoteDetailPresenter(quoteModel: quoteModel)
      presenter.view = view
      view.presenter = presenter
    return view
  }
}
