//
//  PhotoManager.swift
//  Assignment3-N01459385
//
//  Created by Luiz Fernando Reis on 2021-11-13.
//

import Foundation

class PhotoManager {
    private var photoList = [PhotoInfo]()
    
    func addNewPhoto(newPhoto: PhotoInfo){
        photoList.append(newPhoto)
    }
    
    func getAllPhotos() -> [PhotoInfo] {
        return photoList
    }
}
