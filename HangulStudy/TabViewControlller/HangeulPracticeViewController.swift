//
//  HangeulPracticeViewController.swift
//  HangulStudy
//
//  Created by EAN on 20/10/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit

class HangeulPracticeViewController: UIViewController {

    @IBOutlet weak var topImage: UIView!
    @IBOutlet weak var bottomImage: UIView!
    
    @IBOutlet var btnCollection:[UIButton]!
    
    var selectTagNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        for btn in btnCollection {
            btn.layer.cornerRadius = btn.frame.size.width/2.0
        }
        
        topImage.layer.cornerRadius = topImage.frame.size.height/2.0
        bottomImage.layer.cornerRadius = bottomImage.frame.size.height/2.0
    }
    
    @IBAction func moveToDetailView(btn: UIButton) {
        selectTagNum = btn.tag
        self.performSegue(withIdentifier: "showHangeulDetailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHangeulDetailView" {
            let vc = segue.destination as! HangeulPracticeDetailViewController
            vc.selectWord = selectTagNum - 1
        }
    }
}
