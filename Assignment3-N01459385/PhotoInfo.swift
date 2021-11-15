//
//  PhotoInfo.swift
//  Assignment3-N01459385
//
//  Created by Luiz Fernando Reis on 2021-11-13.
//

import Foundation

class PhotoInfo {
    var title : String = ""
    var url : URL
    
    init(t: String, u: URL) {
        title = t
        url = u
    }
}
