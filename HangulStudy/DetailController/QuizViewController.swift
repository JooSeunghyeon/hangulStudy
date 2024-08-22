//
//  QuizViewController.swift
//  HangulStudy
//
//  Created by EAN on 15/01/2020.
//  Copyright © 2020 EAN. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {

    let word_a = ["가지","나무","사과","아기","어항","여우","오이","우유","으뜸","이불","자석","타로","하트"]
    let word_b = ["다람쥐","라일락","마이크","바나나","야자수","유리컵","카메라"]
    let word_c = ["요구르트","파인애플","아이스크림"]
    
    let hint_a = ["ナス","木","リンゴ","赤ちゃん","金魚鉢","キツネ","きゅうり","牛乳","最上","布団","磁石","タロット","ハート"]
    let hint_b = ["リス","ライラック","マイク","バナナ","ヤシの木","ガラスカップ","カメラ"]
    let hint_c = ["ヨーグルト","パイナップル","アイスクリーム"]
    
    let sound_a = ["A1I10","B1E7","G1A15","H1A10","H3O1H","H4H7","H5H10","H7H8","H9P9E","H10F7D","I1G3A","L1D5","N1L9"]
    let sound_b = ["C1D1EI20","D1H10DD1A","E1H10K9","F1B1B1","H2IAG7","H8D10K3F","K1E13D1"]
    let sound_c = ["H6A9D9M9","M1H10B","HAH10G9K9D10E"]
    
    let landomWord = ["가","갸","거","겨","고","교","구","규","그","기","개","걔","게","계","과","괘","괴","궈","궤","귀"]
    
    var isFirst = false
    
    @IBOutlet var viewCollection:[UIView]!
    @IBOutlet var btnCollection:[UIButton]!
    
    @IBOutlet weak var btnSuperView: UIView!
    @IBOutlet weak var btnStackView: UIStackView!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStactView: UIStackView!
    
    @IBOutlet weak var viewSuperView: UIView!
    @IBOutlet weak var viewStackView: UIStackView!
    
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var hintView: UIView!
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var wordArray: Array<String> = []
    var hintArray: Array<String> = []
    var soundArray: Array<String> = []
    
    var quizWordString: String = ""
    
    var player: AVAudioPlayer?
    
    var soundFileName: String = ""
    
    var _selectedNum = 0
    var maxCount = 0
    var answerIndex = 0
    var btnMaxCount = 0
    
    var selectedNum: Int {
        get {
            return _selectedNum
        }
        
        set {
            _selectedNum = newValue
            soundFileName = soundArray[newValue]
        }
    }
    
    public var selectWord = 0
    
    var btn1Point: CGPoint = CGPoint(x: 0, y: 0)
    var btn2Point: CGPoint = CGPoint(x: 0, y: 0)
    var btn3Point: CGPoint = CGPoint(x: 0, y: 0)
    var btn4Point: CGPoint = CGPoint(x: 0, y: 0)
    var btn5Point: CGPoint = CGPoint(x: 0, y: 0)
    var btn6Point: CGPoint = CGPoint(x: 0, y: 0)
    var btn7Point: CGPoint = CGPoint(x: 0, y: 0)
    var btn8Point: CGPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch selectWord {
        case 0:
            wordArray = word_a
            hintArray = hint_a
            soundArray = sound_a
            topStackView.isHidden = false
            bottomStactView.isHidden = true
            btnMaxCount = 4
            break
            
        case 1:
            wordArray = word_b
            hintArray = hint_b
            soundArray = sound_b
            topStackView.isHidden = false
            bottomStactView.isHidden = false
            btnMaxCount = 8
            break
            
        case 2:
            wordArray = word_c
            hintArray = hint_c
            soundArray = sound_c
            topStackView.isHidden = false
            bottomStactView.isHidden = false
            btnMaxCount = 8
            break
            
        default:
            break
        }
     
        btn1Point = btnCollection[0].center
        btn2Point = btnCollection[1].center
        btn3Point = btnCollection[2].center
        btn4Point = btnCollection[3].center
        btn5Point = btnCollection[4].center
        btn6Point = btnCollection[5].center
        btn7Point = btnCollection[6].center
        btn8Point = btnCollection[7].center
        
        clearBtn.layer.cornerRadius = clearBtn.frame.size.height/2.0
        hintView.layer.cornerRadius = hintView.frame.size.height/2.0
        
        for btn in btnCollection {
            btn.layer.cornerRadius = btn.frame.size.height/3.0
        }
        
        selectedNum = 0
        maxCount = wordArray.count
        setEnableBtn(num: selectedNum)
        
        self.hintLabel.text = self.hintArray[selectedNum]
        quizSetting ()
        
        let logo = UIImage(named: "AIntroImage")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

    }
    
    override func viewWillLayoutSubviews() {
        
        clearBtn.layer.cornerRadius = clearBtn.frame.size.height/2.0
        hintView.layer.cornerRadius = hintView.frame.size.height/2.0
        
        for btn in btnCollection {
            btn.layer.cornerRadius = btn.frame.size.height/3.0
        }
        
        
        
        //quizSetting ()
        //self.hintLabel.text = self.hintArray[selectedNum]
    }
    
    override func viewDidLayoutSubviews() {
        if (!isFirst && btn1Point != btnCollection[0].center) {
            print(btnCollection[0].center)
            print(btnCollection[1].center)
            btn1Point = btnCollection[0].center
            btn2Point = btnCollection[1].center
            btn3Point = btnCollection[2].center
            btn4Point = btnCollection[3].center
            btn5Point = btnCollection[4].center
            btn6Point = btnCollection[5].center
            btn7Point = btnCollection[6].center
            btn8Point = btnCollection[7].center
            
            isFirst = true
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
            player.currentTime = 1

        } catch let error {
            print(error.localizedDescription)
        }
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
    
    func quizSetting () {
        
        let selectString: String = wordArray[selectedNum]
        
        for view in viewCollection {
            if view.tag < selectString.count {
                view.isHidden = false
            } else {
                view.isHidden = true
            }
        }
        
        // 단어 설정
        //landomWord
        
        var quizWord = Array<String>()
        
        for char in selectString {
            
            quizWord.append(String(char))
        }
        
        repeat {
            
            let number = Int.random(in: 0 ..< landomWord.count)
            var isInclude: Bool = false
            for ch in quizWord {
                if landomWord[number] == ch {
                    isInclude = true
                }
            }
            
            if isInclude == false {
                quizWord.append(landomWord[number])
            }
        } while quizWord.count < btnMaxCount
        
        quizWord.shuffle()
        
        var i: Int = 0
        for word in quizWord {
            btnCollection[i].setTitle(word, for: .normal)
            i += 1
        }
    }
    
    @IBAction func wordBefore(_ sender: Any) {
        
        writeViewClear()
        
        if selectedNum > 0 {
            selectedNum -= 1
            setEnableBtn(num: selectedNum)
            
//            self.wordLabel.text = self.seletwordArray[self.selectedNum]
            self.hintLabel.text = self.hintArray[selectedNum]
            
            quizSetting ()
            
        } else {
            return
        }
    }
    
    @IBAction func wordNext(_ sender: Any) {
        
        writeViewClear()
        
        if selectedNum < maxCount {
            selectedNum += 1
            setEnableBtn(num: selectedNum)
            
//            wordLabel.text = seletwordArray[selectedNum]
            self.hintLabel.text = self.hintArray[selectedNum]
            
            quizSetting ()
            
        } else {
            return
        }
    }
    
    @IBAction func selectWord (_ btn: UIButton) {
        
        let selectString: String = wordArray[selectedNum]
        
        // 단어 수 체크
        if answerIndex >= selectString.count {
            return
        }
        
        var btnSuperViewX: CGFloat = 0
        var btnSuperViewY: CGFloat = 0
        
        if btn.tag < 4 {
            btnSuperViewX = btnSuperView.frame.origin.x + btnStackView.frame.origin.x + topStackView.frame.origin.x
            btnSuperViewY = btnSuperView.frame.origin.y + btnStackView.frame.origin.y + topStackView.frame.origin.y
        } else {
            btnSuperViewX = btnSuperView.frame.origin.x + btnStackView.frame.origin.x + bottomStactView.frame.origin.x
            btnSuperViewY = btnSuperView.frame.origin.y + btnStackView.frame.origin.y + bottomStactView.frame.origin.y
        }
        
        
        let viewSuperViewX = viewSuperView.frame.origin.x + viewStackView.frame.origin.x
        let viewSuperViewY = viewSuperView.frame.origin.y + viewStackView.frame.origin.y
        
        UIView.animate(withDuration: 0.5, animations: ({
            
            let btnX = btn.center.x + (viewSuperViewX + self.viewCollection[self.answerIndex].center.x) - (btnSuperViewX + btn.center.x)
            let btnY = btn.center.y + (viewSuperViewY + self.viewCollection[self.answerIndex].center.y) - (btnSuperViewY + btn.center.y)
            
            // 위치 계산 : 1. 버튼의 절대 위치 계산, 2. view의 절대 위치 계산, 3, 버튼과 뷰의 위치 차를 버튼의 상대 위치에서 뺸다
            btn.center = CGPoint(x: btnX, y: btnY)
        }))
        
        quizWordString.append(btn.titleLabel!.text!)
        print(quizWordString)
        
        
        answerIndex += 1
        
        if answerIndex == selectString.count {
            // 정답 체크
            if selectString == quizWordString {
                self.resultLabel.alpha = 0
                resultLabel.text = "正解!"
            } else {
                self.resultLabel.alpha = 0
                resultLabel.text = "不正解!"
            }
            
            UIView.animate(withDuration: 0.7, animations: ({
                self.resultLabel.alpha = 1
                self.resultLabel.isHidden = false
            }))
        }
    }
    
    @IBAction func doClear(_ sender: Any) {
        writeViewClear()
    }
    
    func writeViewClear () {
        answerIndex = 0
        quizWordString = ""
        
        UIView.animate(withDuration: 0.25, animations: ({
            
            print(self.btn1Point)
            print(self.btn2Point)
        self.btnCollection[0].center = self.btn1Point
        self.btnCollection[1].center = self.btn2Point
        self.btnCollection[2].center = self.btn3Point
        self.btnCollection[3].center = self.btn4Point
        self.btnCollection[4].center = self.btn5Point
        self.btnCollection[5].center = self.btn6Point
        self.btnCollection[6].center = self.btn7Point
        self.btnCollection[7].center = self.btn8Point
        }))
        
        resultLabel.isHidden = true
    }
    
    @IBAction func soundPlay(_ sender: Any) {
        playSound()
    }
}
