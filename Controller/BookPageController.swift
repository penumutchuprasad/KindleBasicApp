//
//  BookPageController.swift
//  KindleBasicTrning
//
//  Created by Leela Prasad on 09/04/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class BookPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var book: Book? {
        didSet{
            self.navigationItem.title = book?.title
            self.pages = (book?.pages)!
            self.collectionView?.reloadData()
        }
    }
    var pages = [Page]()
    let cellId = "ReadingCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.backgroundColor = .white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Close", style: .plain, target: self, action: #selector(onClosePressed))
        
        self.collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.isPagingEnabled = true
    
        if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0.0
    
        }
    }
    
    
    
    
    
    @objc func onClosePressed() {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: CollectionView Delegate Methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        cell.textLabel.text = self.pages[indexPath.item].text
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.width, height: self.collectionView!.frame.height - 44 - 20)
    }
    
    
}
