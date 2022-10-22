//
//  QuoteListViewController.swift

import UIKit

protocol QuoteListViewProviding: AnyObject {
  func showQuotes(quotesArray: [QuoteModel])
  func showError(_ error: String)
}

class QuoteListViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
    
    
  var dataSource: [QuoteModel] = []
    

  var presenter: QuoteListPresenting!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  
      // @available(iOS 5.0, *)
//      open func register(_ nib: UINib?, forCellReuseIdentifier identifier: String)
//      tableView.register(UINib(nibName: "QuoteListCell", bundle: nil), forCellReuseIdentifier: “QuoteListCell”)
      
    tableView.register(QuoteListCell.loadNib, forCellReuseIdentifier: QuoteListCell.reuseIdentifier)
    presenter.onViewDidLoad()
  }
}

extension QuoteListViewController: QuoteListViewProviding {
  func showQuotes(quotesArray: [QuoteModel]) {
    dataSource.append(contentsOf: quotesArray)
    DispatchQueue.main.async { [weak self] in
      self?.tableView.reloadData()
    }
  }
  
  func showError(_ error: String) {
    DispatchQueue.main.async { [weak self] in
      self?.showAlert(with: "", message: error)
    }
  }
}

extension QuoteListViewController: UITableViewDelegate {
  
}

extension QuoteListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteListCell.reuseIdentifier) as? QuoteListCell else { return UITableViewCell() }
    cell.update(with: dataSource[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.showQuoteDetailController(row: indexPath.row)
  }
}
