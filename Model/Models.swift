//
//  Model.swift
//  KindleBasicTrning
//
//  Created by Leela Prasad on 09/04/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

struct Book {
    
    var id: Int?
    var title: String?
    var author: String?
    var pages: [Page]?
    var coverImg: UIImage?
    var coverImageUrl: String?
    
 
    init(json: [String : Any]) {
        
        self.title = json["title"] as? String ?? ""
        self.author = json["author"] as? String ?? ""
        self.coverImageUrl = json["coverImageUrl"] as? String ?? ""
        self.pages = [Page]()
        if let pagesDict = json["pages"] as? [[String:Any]] {
            
            for pageInfo in pagesDict {
                
               // let pageeeeeeee = Page.init(id: pageInfo["id"] as? Int, text: pageInfo["text"] as? String)
                
               // print(pageeeeeeee)
                
                if let pageNo = pageInfo["id"] as? Int {
                    
                    if let pageText = pageInfo["text"] as? String {
                        
                        let page = Page.init(id: pageNo, text: pageText)
                        self.pages?.append(page)
                        
                    }
                    
                }
            }
           
            
        }
        
    }
    
//    init(title: String, author: String, cover: UIImage, pages: [Page]) {
//        self.title = title
//        self.author = author
//        self.pages = pages
//        self.coverImg = cover
//    }
    
}


struct Page {
    
    var id: Int?
    var text: String?
    
//    init(pageNo: Int, text: String) {
//        self.id = pageNo
//        self.text = text
//    }
    
}
