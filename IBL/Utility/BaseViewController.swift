//
//  BaseViewController.swift
//  IBL
//
//  Created by HaiDer's Macbook Pro on 01/08/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    
    //MARK: - IBOutlets

    //MARK: - Variables
    
    var coordinator: MainCoordinator?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localized, style: .default, handler: nil))
        self.present(alert, animated: true, completion: {})
    }
    
    
    
    //MARK: - IBAction
    
    
    
    //MARK: - Functions
    
    

}

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        self.register(UINib(nibName: String(describing: T.self), bundle: .main), forCellReuseIdentifier: String(describing: T.self))
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
        return cell
    }
}

extension String {
    var localized: String {
        get { return NSLocalizedString(self, comment: "") }
    }
}
