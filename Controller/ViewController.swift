//
//  ViewController.swift
//  KindleBasicTrning
//
//  Created by Leela Prasad on 09/04/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var books: [Book]?
    let cellId = "BookCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activityVC = ActivityVC()
        
        present(activityVC, animated: true) {
            self.fetchBooksList()
//            DispatchQueue.main.async {
//                self.dismiss(animated: true, completion: nil)
//                self.tableView.reloadData()
//            }
        }
        
        self.navigationItem.title = "Kindle"
        self.view.backgroundColor = .white
        
        self.setupNavigationBarAppearance()
        self.tableView.backgroundColor = .lightGray
        self.tableView.tableFooterView = UIView()
        self.tableView.register(BookCell.self, forCellReuseIdentifier: cellId)

    }
    
    func setupNavigationBarAppearance() {
        
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        
        
    }
    
    func fetchBooksList() {
        
        self.books = [Book]()

        let urlstring = "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json"
        
        URLSession.shared.dataTask(with: URL(string: urlstring)!) { (data, response, errr) in
            
            if errr != nil {
                print("Stop This Parsing")
                return
            }
            guard let data = data else { return }
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String:Any]] {
                    
                     print(jsonResponse)
                    for bookDict in jsonResponse  {
                        //print(bookDict)
                    
                        let book = Book.init(json: bookDict)
                     //   print(book.author!)
                    
                        self.books?.append(book)
                    
                    }
                }
              
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.dismiss(animated: true, completion: nil)

                }

                
            } catch let err {
                print(err)
                print("Catched Error")
            }
            
        }.resume()
        
    }

    @objc func TargetMethod(sender: Any) {

       print("Button Pressed")

    }
    
    //MARK: TableView Delegate Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookCell
        
        cell.book = books?[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 86.0
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPageController.init(collectionViewLayout: layout)
        let navVC = UINavigationController.init(rootViewController: bookPageController)
        if let selectedBook = books?[indexPath.row] {
            bookPageController.book = selectedBook
            present(navVC, animated: true, completion: nil)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        
        footerView.backgroundColor = .black
        
        let sgmntedContrl = UISegmentedControl.init(items: ["Cloud","Device"])
        sgmntedContrl.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(sgmntedContrl)
        sgmntedContrl.tintColor = .white
        sgmntedContrl.selectedSegmentIndex = 0
        sgmntedContrl.addTarget(self, action: #selector(TargetMethod(sender:)), for: .valueChanged)
        
        footerView.addConstraintsWithVisualStrings(format: "H:|-50-[v0]-50-|", views: sgmntedContrl)
        footerView.addConstraintsWithVisualStrings(format: "V:[v0(35)]-7.5-|", views: sgmntedContrl)

        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
}

