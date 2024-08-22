//
//  ConsonantViewController.swift
//  HangulStudy
//
//  Created by EAN on 23/09/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit

class ConsonantViewController: ParentViewController {

    @IBOutlet var btnCollection:[UIButton]!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        
        for btn in btnCollection {
            btn.layer.cornerRadius = btn.frame.size.width/2.0
        }
    }
    
    @IBAction func moveToWriteView(_ sender: UIButton) {
        
        if (sender.titleLabel!.text != nil) {
            text = sender.titleLabel!.text!
        }
        
        self.performSegue(withIdentifier: "showWriteViewFromConsonantView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWriteViewFromConsonantView" {
            let vc = segue.destination as! WordWriteViewController
            vc.partType = .consonantType
            vc.selectWord = text
        }
    }
}




 

