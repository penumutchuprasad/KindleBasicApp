//
//  PageCell.swift
//  KindleBasicTrning
//
//  Created by Leela Prasad on 09/04/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
    
    let textLabel: UILabel = {
       let lbl = UILabel.init()
        lbl.numberOfLines = 0
        lbl.text = "Your reading text appears here Your reading text appears here Your reading text appears here Your reading text appears here Your reading text appears here Your reading text appears here Your reading text appears here Your reading text appears here"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(textLabel)
        addConstraintsWithVisualStrings(format: "H:|-10-[v0]-10-|", views: textLabel)
        addConstraintsWithVisualStrings(format: "V:|-8-[v0]-8-|", views: textLabel)
    }
    
}
