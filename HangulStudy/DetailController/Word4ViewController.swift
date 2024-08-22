//
//  Word4ViewController.swift
//  HangulStudy
//
//  Created by EAN on 07/03/2020.
//  Copyright © 2020 EAN. All rights reserved.
//

import UIKit

class Word4ViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordImage: UIImageView!
    
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    let word = ["차 茶", "가지 ナス", "나무 木", "사과 リンゴ", "아기 赤ちゃん", "어항 金魚鉢", "여우 キツネ", "오이 きゅうり", "우유 牛乳", "으뜸 最上", "이불 布団", "자석 磁石", "타로 タロット", "하트 ハート", "다람쥐 リス", "라일락 ライラック", "마이크 マイク", "바나나 バナナ", "야자수 ヤシの木", "유리컵 ガラスカップ", "카메라 カメラ", "요구르트ヨ ーグルト", "파인애플 パイナップル", "아이스크림 アイスクリーム"]
    
    var _selectedNum = 0
    var maxCount = 0
    
    var wordFileName: String = ""
    
    var selectedNum: Int {
        get {
            return _selectedNum
        }
        
        set {
            _selectedNum = newValue
         
            wordFileName = word[newValue]
//                soundFileName = resourceVowelsName[newValue]
//                imageFileName = resourceVowelsName[newValue]
         
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        maxCount = word.count
        
        setEnableBtn(num: selectedNum)
        wordLabel.text = word[0]
        
        let logo = UIImage(named: "AIntroImage")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

    }
    

    func setEnableBtn (num: Int) {
        let count = maxCount - 1
        
        if num == 0 {
            
            beforeBtn.isHidden = true
            leftImage.isHidden = true
            nextBtn.isHidden = false
            rightImage.isHidden = false
        } else if num == count {
            
            beforeBtn.isHidden = false
            leftImage.isHidden = false
            nextBtn.isHidden = true
            rightImage.isHidden = true
        } else {
            
            beforeBtn.isHidden = false
            leftImage.isHidden = false
            nextBtn.isHidden = false
            rightImage.isHidden = false
        }
    }
    
    @IBAction func wordBefore(_ sender: Any) {
        
//        writeViewClear()
        
        if selectedNum > 0 {
            selectedNum -= 1
            setEnableBtn(num: selectedNum)
            wordLabel.text = wordFileName
//            wordImage.image = UIImage.init(imageLiteralResourceName: imageFileName)
        } else {
            return
        }
    }
    
    @IBAction func wordNext(_ sender: Any) {
        
//        writeViewClear()
        
        if selectedNum < maxCount {
            selectedNum += 1
            setEnableBtn(num: selectedNum)
            wordLabel.text = wordFileName
//            wordImage.image = UIImage.init(imageLiteralResourceName: imageFileName)
        } else {
            return
        }
    }
}
