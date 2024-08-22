//
//  Word2ViewController.swift
//  HangulStudy
//
//  Created by EAN on 2020/04/27.
//  Copyright © 2020 EAN. All rights reserved.
//

import UIKit
import AVFoundation

class Word2ViewController: ParentViewController {

    let image = ["w1", "w2", "w3", "w4", "w5", "w6", "w7", "w8", "w9", "w10", "w11", "w12", "w13", "w14", "w15", "w16", "w17", "w18", "w19", "w20", "w21", "w22", "w23"]
    
    let word1 = ["차", "가지", "나무", "사과", "아기", "어항", "여우", "오이", "우유", "으뜸", "이불", "자석", "타로", "하트", "다람쥐", "라일락", "마이크", "바나나", "야자수", "유리컵", "카메라", "요구르트", "파인애플"]
    
    let word2 = ["茶", "ナス", "木", "リンゴ", "赤ちゃん", "金魚鉢", "キツネ", "きゅうり", "牛乳", "最上", "布団", "磁石", "タロット", "ハート", "リス", "ライラック", "マイク", "バナナ", "ヤシの木", "ガラスカップ", "カメラ", "ヨーグルト", "パイナップル"]
    
    let music = ["wm1", "wm2", "wm3", "wm4", "wm5", "wm6", "wm7", "wm8", "wm9", "wm10", "wm11", "wm12", "wm13", "wm14", "wm15", "wm16", "wm17", "wm18", "wm19", "wm20", "wm21", "wm22", "wm23"]
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var wordImage: UIImageView!
    @IBOutlet weak var wordString: UILabel!
    @IBOutlet weak var word2String: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var word3String: UILabel!
    
    @IBOutlet weak var wordView1: WordView!
    @IBOutlet weak var wordView2: WordView!
    @IBOutlet weak var wordView3: WordView!
    @IBOutlet weak var wordView4: WordView!
    
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
            soundFileName = music[newValue]
            imageFileName = image[newValue]
        }
    }
    
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var clearBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.transform = self.view.transform.rotated(by: .pi/2);
        
        maxCount = image.count
        setEnableBtn(num: selectedNum)
        imageFileName = "w1"
        soundFileName = "wm1"
        wordImage.image = UIImage.init(imageLiteralResourceName: imageFileName)
        wordString.text = word1[0]
        word2String.text = word2[0]
        word3String.text = word1[0]
//        makeWordView()
        
        wordView1.delegate = self
//        wordView2.delegate = self
//        wordView3.delegate = self
//        wordView4.delegate = self
    }

    override func viewDidLayoutSubviews() {
        clearBtn.layer.cornerRadius = clearBtn.frame.size.height/2.0
    }
    
    @IBAction func doClear(_ sender: Any) {
        writeViewClear()
    }
    
    func writeViewClear () {
        wordView1.setClear()
        wordView2.setClear()
        wordView3.setClear()
        wordView4.setClear()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func doLeft(_ sender: Any) {
        
        writeViewClear()
        
        if selectedNum > 0 {
            selectedNum -= 1
            setEnableBtn(num: selectedNum)
            wordImage.image = UIImage.init(imageLiteralResourceName: imageFileName)
            wordString.text = word1[selectedNum]
            word2String.text = word2[selectedNum]
            word3String.text = word1[selectedNum]
        }
    }
    
    @IBAction func doRight(_ sender: Any) {
        
        writeViewClear()
        
        if selectedNum < maxCount {
            selectedNum += 1
            setEnableBtn(num: selectedNum)
            wordImage.image = UIImage.init(imageLiteralResourceName: imageFileName)
            wordString.text = word1[selectedNum]
            word2String.text = word2[selectedNum]
            word3String.text = word1[selectedNum]
        }
    }
    
    @IBAction func removeSelf(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setEnableBtn (num: Int) {
        let count = maxCount - 1
        
        if num == 0 {
            
            leftBtn.isHidden = true
            leftImage.isHidden = true
            rightBtn.isHidden = false
            rightImage.isHidden = false
        } else if num == count {
            
            leftBtn.isHidden = false
            leftImage.isHidden = false
            rightBtn.isHidden = true
            rightImage.isHidden = true
        } else {
            
            leftBtn.isHidden = false
            leftImage.isHidden = false
            rightBtn.isHidden = false
            rightImage.isHidden = false
        }
    }
    
    func makeWordView () {

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
                player.currentTime = 0.5
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
}

extension Word2ViewController: WordViewwDelegate {
    func touchBeginView() {
        playSound()
    }
}
