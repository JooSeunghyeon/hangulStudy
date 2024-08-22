//
//  TestViewController.swift
//  HangulStudy
//
//  Created by EAN on 26/10/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var beginnerBtn: UIButton!
    @IBOutlet weak var middleBtn: UIButton!
    @IBOutlet weak var advancedBtn: UIButton!
    
    var selectTagNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        
        let btn1BeginColor = #colorLiteral(red: 0.4745098039, green: 0.768627451, blue: 0.9019607843, alpha: 1)
        let btn1EndColor = #colorLiteral(red: 0.2588235294, green: 0.8, blue: 0.8196078431, alpha: 1)
        
        let btn2BeginColor = #colorLiteral(red: 0.537254902, green: 0.537254902, blue: 0.537254902, alpha: 1)
        let btn2EndColor = #colorLiteral(red: 0.3098039216, green: 0.8588235294, blue: 0.7529411765, alpha: 1)
        
        let btn3BeginColor = #colorLiteral(red: 0.9019607843, green: 0.6549019608, blue: 0.4745098039, alpha: 1)
        let btn3EndColor = #colorLiteral(red: 0.8666666667, green: 0.662745098, blue: 0.2823529412, alpha: 1)
        
        setColorForBtn(beginColor: btn1BeginColor, endColor: btn1EndColor, tBtn: beginnerBtn)
        setColorForBtn(beginColor: btn2BeginColor, endColor: btn2EndColor, tBtn: middleBtn)
        setColorForBtn(beginColor: btn3BeginColor, endColor: btn3EndColor, tBtn: advancedBtn)
    }
    
    func setColorForBtn(beginColor: UIColor, endColor: UIColor, tBtn: UIButton) {
        var colors = [UIColor]()
        colors.append(beginColor)
        colors.append(endColor)
        let gradientLayer = CAGradientLayer(frame: self.view.frame, colors: colors, startPoint: CGPoint(x: 0.5, y:0), endPoint: CGPoint(x:0.5, y:1))
        tBtn.setBackgroundImage(gradientLayer.createGradientImage(), for: UIControl.State.normal)
        tBtn.layer.cornerRadius = 10
        tBtn.layer.masksToBounds = true
    }
    
    @IBAction func moveToDetailView(btn: UIButton) {
        selectTagNum = btn.tag
        self.performSegue(withIdentifier: "showQuizView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuizView" {
            let vc = segue.destination as! QuizViewController
            vc.selectWord = selectTagNum
        }
    }
    //showQuizView
}
