//
//  ImageLoader.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 27.06.21.
//

import Foundation
import UIKit.UIImageView

protocol ImageLoaderProtocol {
    func getProfileImage(for urlString: String)
}

final class ImageLoader: ImageLoaderProtocol{
   
    private var dataService: DataServiceProtocol!
    private static var imageCache = NSCache<NSString, UIImage>()
    var onFetchedImage: (UIImage?)->() = { _ in }
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
    
    func getProfileImage(for urlString: String){
        
        onFetchedImage(nil)
        
        if let imageFromCache = ImageLoader.imageCache.object(forKey: urlString as NSString) {
            //if the image already exist in the cache, set image from cache and return
            onFetchedImage(imageFromCache)
            return
        }
        
        guard let dataService = dataService, let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async {
            dataService.fetchData(for: url) { [weak self] result in
                guard let self = self else {
                    return
                }
                
                switch result{
                case .failure:
                    self.onFetchedImage(nil)
                case .success(let data):
                    guard let image = UIImage(data: data) else {
                        return
                    }
                    self.onFetchedImage(image)
                    ImageLoader.imageCache.setObject(image, forKey: urlString as NSString)
                }
            }
        }
    }
}
