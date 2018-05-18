//
//  item.swift
//  Projet_swift
//
//  Created by Developer on 16/05/2018.
//  Copyright © 2018 Nicolas Depero. All rights reserved.
//

import Foundation
import UIKit

struct Item: Codable {
    var URL :String
    var Text :String
    var ImgData: Data?
    
    var image: UIImage? {
        
        if let data = ImgData {
            return UIImage(data: data)
        }
        
        return nil
    }
}

