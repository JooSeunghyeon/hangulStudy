//
//  MainViewController.swift
//  HangulStudy
//
//  Created by EAN on 15/10/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit

class MainViewController: ParentViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var graphBarImage: UIImageView!
    
    @IBOutlet weak var personView: UIView!
    
    @IBOutlet weak var personBtn1: UIButton!
    @IBOutlet weak var personBtn2: UIButton!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let logo = UIImage(named: "AIntroImage")
//        let imageView = UIImageView(image:logo)
//        
//        self.navigationItem.titleView = imageView
//        
//        navigationItem.title = "eqweqweq"

    }
    
    override func viewDidLayoutSubviews() {
       
       
        
        let btn1BeginColor = #colorLiteral(red: 0.4745098039, green: 0.8039215686, blue: 0.9019607843, alpha: 1)
        let btn1EndColor = #colorLiteral(red: 0.2588235294, green: 0.7764705882, blue: 0.8196078431, alpha: 1)
        
        let btn2BeginColor = #colorLiteral(red: 0.2980392157, green: 0.9176470588, blue: 0.7019607843, alpha: 1)
        let btn2EndColor = #colorLiteral(red: 0.3098039216, green: 0.8588235294, blue: 0.7529411765, alpha: 1)
        
        let btn3BeginColor = #colorLiteral(red: 0.6862745098, green: 0.8509803922, blue: 0.4274509804, alpha: 1)
        let btn3EndColor = #colorLiteral(red: 0.768627451, green: 0.8352941176, blue: 0.2666666667, alpha: 1)
        
        let btn4BeginColor = #colorLiteral(red: 0.9607843137, green: 0.6, blue: 0.4666666667, alpha: 1)
        let btn4EndColor = #colorLiteral(red: 0.9607843137, green: 0.6274509804, blue: 0.2352941176, alpha: 1)
        
        setColorForBtn(beginColor: btn1BeginColor, endColor: btn1EndColor, tBtn: btn1)
        setColorForBtn(beginColor: btn2BeginColor, endColor: btn2EndColor, tBtn: btn2)
        setColorForBtn(beginColor: btn3BeginColor, endColor: btn3EndColor, tBtn: btn3)
        setColorForBtn(beginColor: btn4BeginColor, endColor: btn4EndColor, tBtn: btn4)
        
        let graphImage = UIImage(named: "graphBar")
        graphBarImage.image = graphImage?.withColor(#colorLiteral(red: 0.9882352941, green: 0.4549019608, blue: 0.4745098039, alpha: 1), percent: 11)
    }
    
    func setColorForBtn(beginColor: UIColor, endColor: UIColor, tBtn: UIButton) {
        var colors = [UIColor]()
        colors.append(beginColor)
        colors.append(endColor)
        let gradientLayer = CAGradientLayer(frame: self.view.frame, colors: colors, startPoint: CGPoint(x: 0.5, y:0), endPoint: CGPoint(x:0.5, y:1))
        tBtn.setBackgroundImage(gradientLayer.createGradientImage(), for: UIControl.State.normal)
        tBtn.layer.cornerRadius = 10
        tBtn.layer.masksToBounds = true
        
        self.roundCorners(view: personView, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 10.0)
        personView.layer.masksToBounds = true
        
        personBtn1.layer.cornerRadius = 5
        personBtn1.layer.masksToBounds = true
        
//        personBtn2.layer.cornerRadius = 5
//        personBtn2.layer.masksToBounds = true
        
        personImageView.layer.cornerRadius = personImageView.frame.size.width/2.0
        personImageView.layer.masksToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showConsonantView" {
            
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        } else if segue.identifier == "showVowelView" {
            
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        }
    }

    @IBAction func moveToConsonantView(_ sender: Any) {
        self.performSegue(withIdentifier: "showConsonantView", sender: self)
    }
    
    @IBAction func moveToVowelView(_ sender: Any) {
        self.performSegue(withIdentifier: "showVowelView", sender: self)
    }
    
    @IBAction func moveToSupportView(_ sender: Any) {
        self.performSegue(withIdentifier: "showSupportView", sender: self)
    }
    
    @IBAction func moveToWordView(_ sender: Any) {
        
        let myViewController = Word2ViewController(nibName: "Word2ViewController", bundle: nil)
        myViewController.modalPresentationStyle = .fullScreen
        self.present(myViewController, animated: true, completion: nil)
        
//        self.performSegue(withIdentifier: "showWord4", sender: self)
    }
    
    @IBAction func moveYoutube (_ sender: Any) {
//        let YoutubeQuery =  "Your Query"
//        let escapedYoutubeQuery = YoutubeQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let appURL = NSURL(string: "youtube://www.youtube.com/channel/UCxswp9mZhWkXlizqKZbBitA")!
        let webURL = NSURL(string: "https://www.youtube.com/channel/UCxswp9mZhWkXlizqKZbBitA")!
        let application = UIApplication.shared

        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Youtube app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
}
