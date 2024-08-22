//
//  SupportViewController.swift
//  HangulStudy
//
//  Created by EAN on 26/10/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit

class SupportViewController: ParentViewController {

    @IBOutlet weak var detailShowBtn: UIButton!
    
    var btnType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        
        detailShowBtn.layer.cornerRadius = detailShowBtn.frame.size.height/2.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCaseDetailView" {
            let vc = segue.destination as! CaseDetailViewController
            
            if btnType == 1 {
                vc.caseType = .case1Type
            } else if btnType == 2 {
                vc.caseType = .case2Type
            } else if btnType == 3 {
                vc.caseType = .case3Type
            }
        }
    }
    
    @IBAction func showCase1Btn(_ sender: Any) {
        
        btnType = 1
        self.performSegue(withIdentifier: "ShowCaseDetailView", sender: self)
    }
    
    @IBAction func showCase2Btn(_ sender: Any) {
        
        btnType = 2
        self.performSegue(withIdentifier: "ShowCaseDetailView", sender: self)
    }
    
    @IBAction func showCase3Btn(_ sender: Any) {
        
        btnType = 3
        self.performSegue(withIdentifier: "ShowCaseDetailView", sender: self)
    }
}
