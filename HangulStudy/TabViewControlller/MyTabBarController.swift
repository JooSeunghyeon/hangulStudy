//
//  MyTabBarController.swift
//  HangulStudy
//
//  Created by EAN on 2020/05/18.
//  Copyright © 2020 EAN. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "AIntroImage")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
