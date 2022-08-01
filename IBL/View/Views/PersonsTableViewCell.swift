//
//  PersonsTableViewCell.swift
//  IBL
//
//  Created by HaiDer's Macbook Pro on 01/08/2022.
//

import UIKit
import SDWebImage

class PersonsTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    
    //MARK: - Functions
    
    func config(data : Result?) {
        self.nameLbl.text = "Name: \(data?.name.first ?? "") \(data?.name.last ?? "")"
        self.streetLbl.text = "Street: \(data?.location.street.name ?? "")"
        self.cityLbl.text = "City: \(data?.location.city ?? "")"
        self.setImage(imageView: imgView, url: URL(string:data?.picture.medium ?? "")!)
    }
    
    
    func setImage(imageView:UIImageView,url:URL,placeHolder : String = "dummy")  {
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_imageIndicator?.startAnimatingIndicator()
        
        imageView.sd_setImage(with: url) { (img, err, cahce, URI) in
            imageView.sd_imageIndicator?.stopAnimatingIndicator()
            if err == nil {
                imageView.image = img
            } else {
                imageView.image = UIImage(named: placeHolder)
            }
        }
    }
}
