//
//  WordWriteViewController.swift
//  HangulStudy
//
//  Created by EAN on 23/09/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit
import AVFoundation

class WordWriteViewController: ParentViewController {

    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var wordView: UIView!

    @IBOutlet weak var writeView1: WordView!
    @IBOutlet weak var writeView2: WordView!
    
    @IBOutlet weak var wordImage: UIImageView!
    
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var voiceWord: UILabel!
    
    var scrollView: UIScrollView!
    
    var player: AVAudioPlayer?
    
    public var partType: PartType = .noneType
    
    let consonant = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ", "ㄲ", "ㄸ", "ㅃ", "ㅆ", "ㅉ"]
    let consonant_voice = ["k/g", "n", "t/d", "r/l", "m", "p/b", "s", "ɳ", "j", "ch", "k", "t", "p", "h", "kk", "tt", "pp", "ss", "jj"]
    let resourceConsonantName = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"]
    let vowels =       ["ㅏ", "ㅑ", "ㅓ", "ㅕ", "ㅗ", "ㅛ", "ㅜ", "ㅠ", "ㅡ", "ㅣ", "ㅐ", "ㅒ", "ㅔ", "ㅖ", "ㅘ", "ㅙ", "ㅚ", "ㅝ", "ㅞ", "ㅟ", "ㅢ"]
    let vowels_voice = ["a", "ya", "eo", "yeo", "o", "yo", "u", "yu", "eu", "i", "e", "ye", "e", "ye", "wa", "wae", "we", "wo", "we", "yi", "eui"]
    let resourceVowelsName = ["H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12", "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21"]
    
    var soundFileName: String = ""
    var imageFileName: String = ""
    
    var _selectedNum = 0
    var maxCount = 0
    
    var selectedNum: Int {
        get {
            return _selectedNum
        }
        
        set {
            _selectedNum = newValue
            if partType == .consonantType {
                imageFileName = resourceConsonantName[newValue]
            } else {
                soundFileName = resourceVowelsName[newValue]
                imageFileName = resourceVowelsName[newValue]
            }
        }
    }
    
    var _selectWord: String = ""
    public var selectWord: String {
        get {
            return _selectWord
        }
        
        set {
            _selectWord = newValue
            
            if partType == .consonantType {
                guard let num = consonant.firstIndex(of: selectWord) else { return }
                selectedNum = num
            } else if partType == .vowelType {
                guard let num = vowels.firstIndex(of: selectWord) else { return }
                selectedNum = num
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        writeView1.delegate = self
        writeView2.delegate = self
        
        if partType == .consonantType {
            maxCount = consonant.count
        } else if partType == .vowelType {
            maxCount = vowels.count
        }
        
        setEnableBtn(num: selectedNum)
        wordImage.image = UIImage.init(imageLiteralResourceName: imageFileName)
        
        if partType == .consonantType {
            voiceWord.text = String(format: "( %@ )", consonant_voice[selectedNum])
        } else {
            voiceWord.text = String(format: "( %@ )", vowels_voice[selectedNum])
        }
    }

    override func viewDidLayoutSubviews() {
        clearBtn.layer.cornerRadius = clearBtn.frame.size.height/2.0
    }
    
    @IBAction func doClear(_ sender: Any) {
        writeViewClear()
    }
    
    func writeViewClear () {
        writeView1.setClear()
        writeView2.setClear()
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
            if soundFileName == "H11" {
                player.currentTime = 0.5
            } else if soundFileName == "H13" {
                player.currentTime = 0.5
            } else if soundFileName == "H10" {
                player.currentTime = 1.8
            } else {
                player.currentTime = 1
            }


        } catch let error {
            print(error.localizedDescription)
        }
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
        
        writeViewClear()
        
        if selectedNum > 0 {
            selectedNum -= 1
            setEnableBtn(num: selectedNum)
            wordImage.image = UIImage.init(imageLiteralResourceName: imageFileName)
            if partType == .consonantType {
                voiceWord.text = String(format: "( %@ )", consonant_voice[selectedNum])
            } else {
                voiceWord.text = String(format: "( %@ )", vowels_voice[selectedNum])
            }
        } else {
            return
        }
    }
    
    @IBAction func wordNext(_ sender: Any) {
        
        writeViewClear()
        
        if selectedNum < maxCount {
            selectedNum += 1
            setEnableBtn(num: selectedNum)
            wordImage.image = UIImage.init(imageLiteralResourceName: imageFileName)
            if partType == .consonantType {
                voiceWord.text = String(format: "( %@ )", consonant_voice[selectedNum])
            } else {
                voiceWord.text = String(format: "( %@ )", vowels_voice[selectedNum])
            }
        } else {
            return
        }
    }
}

extension WordWriteViewController: WordViewwDelegate {
    func touchBeginView() {        
        if partType == .consonantType {
            
        } else if partType == .vowelType {
            playSound()
        }
    }
}
