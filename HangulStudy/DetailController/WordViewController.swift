//
//  WordViewController.swift
//  HangulStudy
//
//  Created by EAN on 14/01/2020.
//  Copyright © 2020 EAN. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "AIntroImage")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UIDevice.current.orientation == .landscapeRight {
            let value = UIDeviceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }
        
        let value = UIDeviceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.landscapeRight]
    }
}
