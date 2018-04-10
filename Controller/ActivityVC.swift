//
//  ActivityVC.swift
//  MyAPPStore
//
//  Created by Leela Prasad on 04/04/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

class ActivityVC: UIViewController {
    
    var activityIndctr: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange.withAlphaComponent(0.45)

        activityIndctr = UIActivityIndicatorView.init()
        activityIndctr.activityIndicatorViewStyle = .whiteLarge
        activityIndctr.color = .blue
        //activityIndctr.hidesWhenStopped = true
        activityIndctr.frame.size = CGSize.init(width: 100, height: 75)
        activityIndctr.center = self.view.center
        view.addSubview(activityIndctr)

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndctr.startAnimating()

        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndctr.stopAnimating()
        
    }
    
    
    
}
