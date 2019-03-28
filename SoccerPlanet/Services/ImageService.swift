//
//  ImageService.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 15/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit


class ImageService{
    
    static let cache = NSCache<NSString,UIImage>()
    
    
    static func downloadImage(withURL url:URL,completion:@escaping (UIImage?) -> Void){
        let dataTask = URLSession.shared.dataTask(with: url){
            data,responseURL,error in
            var downloadedImage:UIImage?
            
            if let data = data{
                downloadedImage = UIImage(data: data)
            }
            
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
            }
            

            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }
        
        dataTask.resume()
    }
    
    static func getImage(withURL url:URL,completion:@escaping (UIImage?) -> Void){
        if let image = cache.object(forKey: url.absoluteString as NSString){
            completion(image)
        }
        else{
            downloadImage(withURL: url, completion: completion)
        }
    }
    
    
}
