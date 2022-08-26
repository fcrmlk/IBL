//
//  IBLViewController.swift
//  IBL
//
//  Created by HaiDer's Macbook Pro on 01/08/2022.
//

import UIKit
import MapKit

class IBLViewController: BaseViewController {


    
    //MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLbl: UILabel!
    
    //MARK: - Variables
    
    var personData : [Result]?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchPersonData()
        self.activityIndicator.isHidden = true
    }


    
    @IBAction func refresh(_ sender: Any) {
        self.fetchPersonData()
    }
    
}

extension IBLViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(PersonsTableViewCell.self, indexPath: indexPath)
        cell.selectionStyle = .none
        cell.config(data: self.personData?[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Information"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


