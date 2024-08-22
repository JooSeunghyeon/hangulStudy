//
//  CaseDetailViewController.swift
//  HangulStudy
//
//  Created by EAN on 26/10/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit
import AVFoundation

class CaseDetailViewController: ParentViewController {
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var clearBtn: UIButton!
    
    @IBOutlet weak var word: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var writeView1: WordView!
    @IBOutlet weak var writeView2: WordView!
    
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    public var caseType: CaseType = .caseNoneType
    
    var player: AVAudioPlayer?
    
    let case_1_word = ["강", "밥", "약"]
    let case_2_word = ["눈", "문", "물"]
    let case_3_word = ["권", "왕", "웹"]
    
    let case_1_word_jp = ["川", "ご飯", "薬"]
    let case_2_word_jp = ["目", "ドア", "水"]
    let case_3_word_jp = ["冊", "王", "ウェブ"]
    
    let case_1_image = ["case_1_1", "case_1_2", "case_1_3"]
    let case_2_image = ["case_2_1", "case_2_2", "case_2_3"]
    let case_3_image = ["case_3_1", "case_3_2", "case_3_3"]
    
    let case_1_sound = ["강", "밥", "약"]
    let case_2_sound = ["눈", "문", "물"]
    let case_3_sound = ["권", "왕", "웹"]
    
    var soundFileName: String = ""
    var imageFileName: String = ""
    var koreaWord: String = ""
    var jpWord: String = ""
    
    var _selectedNum = 0
    var maxCount = 0
    
    var selectedNum: Int {
        get {
            return _selectedNum
        }
        
        set {
            _selectedNum = newValue
            if caseType == .case1Type {
                imageFileName = case_1_image[newValue]
                soundFileName = case_1_sound[newValue]
                koreaWord = case_1_word[newValue]
                jpWord = case_1_word_jp[newValue]
            } else if caseType == .case2Type {
                imageFileName = case_2_image[newValue]
                soundFileName = case_2_sound[newValue]
                koreaWord = case_2_word[newValue]
                jpWord = case_2_word_jp[newValue]
            } else if caseType == .case3Type {
                imageFileName = case_3_image[newValue]
                soundFileName = case_3_sound[newValue]
                koreaWord = case_3_word[newValue]
                jpWord = case_3_word_jp[newValue]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        writeView1.delegate = self
        writeView2.delegate = self
        
        selectedNum = 0
        setEnableBtn(num: selectedNum)
        
        if caseType == .case1Type {
            
            image1.image = UIImage(named: "case1")
            word.text = String(format: "%@ %@", koreaWord, jpWord)
            setWordLabel (tagetString: jpWord)
            
            maxCount = case_1_word.count
        } else if caseType == .case2Type {
            
            image1.image = UIImage(named: "case2")
            word.text = String(format: "%@ %@", koreaWord, jpWord)
            setWordLabel (tagetString: jpWord)
            
            maxCount = case_2_word.count
        } else if caseType == .case3Type {
            
            image1.image = UIImage(named: "case3")
            word.text = String(format: "%@ %@", koreaWord, jpWord)
            setWordLabel (tagetString: jpWord)
            maxCount = case_3_word.count
        }
        
        image2.image = UIImage(named: imageFileName)
    }
    
    override func viewDidLayoutSubviews() {
        
        topImageView.layer.cornerRadius = topImageView.frame.size.height/2.0
        clearBtn.layer.cornerRadius = clearBtn.frame.size.height/2.0
        
        
    }
    
    func setWordLabel (tagetString: String) {
        let attributedStr = NSMutableAttributedString(string: word.text!)
        attributedStr.addAttribute(.foregroundColor, value: #colorLiteral(red: 0.4470588235, green: 0.4470588235, blue: 0.4470588235, alpha: 1), range: (word.text! as NSString).range(of: tagetString))
        
        let font: UIFont = UIFont(name: "SF Pro Display", size: 25)!
        attributedStr.addAttribute(.font, value: font, range: (word.text! as NSString).range(of: tagetString))
        word.attributedText = attributedStr
    }
    
    @IBAction func wordBefore(_ sender: Any) {
        
        writeViewClear()
        
        if selectedNum > 0 {
            selectedNum -= 1
            setEnableBtn(num: selectedNum)
            image2.image = UIImage(named: imageFileName)
            word.text = String(format: "%@ %@", koreaWord, jpWord)
            setWordLabel (tagetString: jpWord)
        } else {
            return
        }
    }
    
    @IBAction func wordNext(_ sender: Any) {
        
        writeViewClear()
        
        if selectedNum < maxCount {
            selectedNum += 1
            setEnableBtn(num: selectedNum)
            image2.image = UIImage(named: imageFileName)
            word.text = String(format: "%@ %@", koreaWord, jpWord)
            setWordLabel (tagetString: jpWord)
        } else {
            return
        }
    }
    
    @IBAction func doClear(_ sender: Any) {
        writeViewClear()
    }
    
    func writeViewClear () {
        writeView1.setClear()
        writeView2.setClear()
    }
    
    func setEnableBtn (num: Int) {
        let count = maxCount - 1
        
        if num == 0 {
            
            beforeBtn.isHidden = true
            nextBtn.isHidden = false
        } else if num == count {
            
            beforeBtn.isHidden = false
            nextBtn.isHidden = true
        } else {
            
            beforeBtn.isHidden = false
            nextBtn.isHidden = false
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()
            
//            player.play()
            if soundFileName == "강" {
                player.currentTime = 2.5
            } else if soundFileName == "밥" {
                player.currentTime = 2
            } else if soundFileName == "약" {
                player.currentTime = 1.8
            } else if soundFileName == "물" {
                player.currentTime = 2
            } else if soundFileName == "웹" {
                player.currentTime = 1
            } else if soundFileName == "왕" {
                player.currentTime = 2
            } else if soundFileName == "권" {
                player.currentTime = 1.7
            } else {
                player.currentTime = 1.5
            }

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

extension CaseDetailViewController: WordViewwDelegate {
    func touchBeginView() {
        playSound()
    }
}
