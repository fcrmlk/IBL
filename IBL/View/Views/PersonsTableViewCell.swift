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
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    
    //MARK: - Functions
    
    func config(data : Result?) {
        self.gender.text = "Gender: \(data?.gender ?? "")"
        self.emailLbl.text = "Email: \(data?.email ?? "")"
        self.userName.text = "UserName: \(data?.login.username ?? "")"
        self.dobLbl.text = "Age: \(data?.dob.age ?? 0)"
        self.cityLbl.text = "Location: \(data?.location.city ?? ""),\(data?.location.country ?? "")"
        self.phoneNumber.text = "Phone: \(data?.phone ?? "")"
        self.streetLbl.text = "Street: \(data?.location.street.name ?? "") \(data?.location.street.number ?? 0)"
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
