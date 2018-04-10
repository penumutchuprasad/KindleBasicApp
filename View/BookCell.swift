//
//  BookCell.swift
//  KindleBasicTrning
//
//  Created by Leela Prasad on 09/04/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit


extension UIView {
    
    
    func addConstraintsWithVisualStrings(format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        for (index,view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            let key = "v\(index)"
            viewsDict[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
    
    
}

class BasicCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
//        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        print("Basic Cell Setup Function is called")
        
    }
    
}




class BookCell: BasicCell {
    
    var book: Book? {
        
        didSet{
            self.bookTitleLabel.text = book?.title
            self.bookAuthorLabel.text = book?.author
             do {
                let image = try UIImage.init(data: Data.init(contentsOf: URL.init(string: (book?.coverImageUrl)!)!))

                DispatchQueue.main.async {
                    self.bookImageView.image = image
                }
            } catch {
                
            }
        }
    
    }
    
   private var bookImageView: UIImageView = {
       
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
//        imgView.layer.cornerRadius = imgView.frame.width/2
//        imgView.layer.masksToBounds = true
        return imgView
    }()
    
   private var bookTitleLabel: UILabel = {
       
        let lbl = UILabel.init()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textColor = .black
        //lbl.backgroundColor = .red
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
   private var bookAuthorLabel: UILabel = {
        
        let lbl = UILabel.init()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //lbl.backgroundColor = .red
        return lbl
    }()
    
    
    override func setupViews() {
       // super.setupViews()

        backgroundColor = .clear
        addSubview(bookImageView)
        addSubview(bookTitleLabel)
        addSubview(bookAuthorLabel)
        
        bookImageView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor, constant: 8).isActive = true
        bookImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        bookImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        bookImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        bookTitleLabel.leftAnchor.constraint(equalTo: self.bookImageView.rightAnchor, constant: 8).isActive = true
        bookTitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        bookTitleLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor, constant: -8).isActive = true
        bookTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -12.5).isActive = true
        
        bookAuthorLabel.leftAnchor.constraint(equalTo: self.bookImageView.rightAnchor, constant: 8).isActive = true
        bookAuthorLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor, constant: -8).isActive = true
        bookAuthorLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 12.5).isActive = true
        bookAuthorLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true

//        addConstraintsWithVisualStrings(format: "H:|-8-[v0(65)]-8-[v1]-8-|", views: bookImageView,bookTitle)
//        addConstraintsWithVisualStrings(format: "V:|-4-[v0]-4-|", views: bookImageView)
//        //NSLayoutConstraint.activate([NSLayoutConstraint.init(item: bookImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
//
//        addConstraintsWithVisualStrings(format: "V:|-14-[v0(30)]", views: bookTitle)
//
//       NSLayoutConstraint.activate([NSLayoutConstraint.init(item: bookAuthor, attribute: .leading, relatedBy: .equal, toItem: bookTitle, attribute: .leading, multiplier: 1, constant: 0),NSLayoutConstraint.init(item: bookAuthor, attribute: .trailing, relatedBy: .equal, toItem: bookTitle, attribute: .trailing, multiplier: 1, constant: 0)])
//        addConstraintsWithVisualStrings(format: "V:[v0(25)]-8-|", views: bookAuthor)

    }
    
    
    
    
    
    
    
}
