//
//  NewsTableViewCell.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 11/7/23.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell{
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    
    
    func setCellWithValuesOf(article: Articles){
        updateUI(title: article.title, image: article.urlToImage, description: article.description)
    }
    
    private func updateUI(title : String?, image: String?, description: String?){
        titleText.text = title
        descriptionText.text = description
        
        guard let imageUrl = URL(string: image!)else{
            newImage.image = UIImage(named: "loading")
            return
        }
        
        
        newImage.image = nil
        getImageFrom(url: imageUrl)
    }
    
    private func getImageFrom(url: URL){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("image download error:: \(error)")
                return
            }
            
            guard let data = data else{
                print("empty image")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data){
                    self.newImage.image = image
                }
            }
        }.resume()
    }
}
