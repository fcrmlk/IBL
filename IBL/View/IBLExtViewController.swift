//
//  IBLExtViewController.swift
//  IBL
//
//  Created by HaiDer's Macbook Pro on 01/08/2022.
//

import UIKit
import SDWebImage

extension IBLViewController {

    func fetchPersonData() {
        let url = URL(string: "https://randomuser.me/api/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                DispatchQueue.main.async {
                    self.showAlert(title: "Error!", message: "Check your internet connection")
                }
                      return
                  }
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                DispatchQueue.main.async {
                    self.fetchPersonData()
                }
                return
            }
            if let model = try? JSONDecoder().decode(Welcome.self, from: data) {
                defer {
                    
                    DispatchQueue.main.async {
                        self.setImage(imageView: self.imgView, url: URL(string:self.personData?.first?.picture.medium ?? "")!)
                        self.tableView.reloadData()
                        self.tableView.isHidden = false
                        self.imgView.isHidden = false
                        self.nameLbl.isHidden = false
                        self.nameLbl.text = "\(self.personData?.first?.name.title ?? "") \(self.personData?.first?.name.first ?? "") \(self.personData?.first?.name.last ?? "")"
                    }
                    
                }
                self.personData = model.results
                
            }
            else {
                print("Failed")
                DispatchQueue.main.async {
                    self.fetchPersonData()
                }
            }
        }
        
        task.resume()
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
