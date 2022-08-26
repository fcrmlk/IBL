//
//  PersonsTableViewCell.swift
//  IBL
//
//  Created by HaiDer's Macbook Pro on 01/08/2022.
//

import UIKit
import SDWebImage
import MapKit

class PersonsTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    //MARK: - Variables
    
    var currentLocation: CLLocation!
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    //MARK: - Functions
    
    func config(data : Result?) {
        self.userName.text = "UserName: \(data?.login.username ?? "")"
        self.gender.text = "Gender: \(data?.gender ?? "")"
        self.emailLbl.text = "Email: \(data?.email ?? "")"
        self.dobLbl.text = "Age: \(data?.dob.age ?? 0)"
        self.phoneNumber.text = "Phone: +\(data?.phone ?? "")"
        let annotation = MKPointAnnotation()
        let centerRegionCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: Double(data?.location.coordinates.latitude ?? "0.0") ?? 0.0, longitude: Double(data?.location.coordinates.longitude ?? "0.0") ?? 0.0)
        annotation.coordinate = centerRegionCoordinate
        annotation.title = "\(data?.name.first ?? "")"
        mapView.addAnnotation(annotation)
        mapView.setCenter(centerRegionCoordinate, animated: true)
        
        
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
