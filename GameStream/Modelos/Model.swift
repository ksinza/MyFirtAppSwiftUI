//
//  Model.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 3/08/22.
//

import Foundation

struct Resultados: Codable {
    
    var results:[Game]
    
}

struct Games: Codable {
    
    var games:[Game]
    
}


struct Game: Codable, Hashable {
    
    var title:String
    var studio: String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:VideoUrl
    var galleryImages:[String]
    
    
    
}

struct VideoUrl: Codable, Hashable{
    
    var mobile: String
    
    var tablet: String
    
}
