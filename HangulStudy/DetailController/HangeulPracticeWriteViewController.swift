//
//  HangeulPracticeWriteViewController.swift
//  HangulStudy
//
//  Created by EAN on 14/01/2020.
//  Copyright © 2020 EAN. All rights reserved.
//

import UIKit
import AVFoundation

class HangeulPracticeWriteViewController: ParentViewController {
    
    let word_a = ["가","갸","거","겨","고","교","구","규","그","기","개","걔","게","계","과","괘","괴","궈","궤","귀"]
    let word_b = ["나","냐","너","녀","노","뇨","누","뉴","느","니","내","네","뇌"]
    let word_c = ["다","댜","더","뎌","도","됴","두","듀","드","디","대","데","돼","되","둬","뒤"]
    let word_d = ["라","랴","러","려","로","료","루","류","르","리", "래","레","뢰"]
    let word_e = ["마","먀","머","며","모", "묘","무","뮤","므","미","매","메","뫼"]
    let word_f = ["바","뱌","버","벼","보","뵤","부","뷰","브","비","배","베","봐","봬","뵈"]
    let word_g = ["사","샤","서","셔","소","쇼","수","슈","스","시","새","세","쇠","쉬"]
    let word_h = ["아","야","어","여","오","요","우","유","으","이","애","얘","에","예","와","왜","외","워","웨","위","의"]
    let word_i = ["자","쟈","저","져","조","죠","주","쥬","즈","지","재", "쟤","제","좌","죄","쥐"]
    let word_j = ["차","챠","처","쳐","초","쵸","추","츄","츠","치","채","체","최","췌","취"]
    let word_k = ["카","캬","커","켜","코","쿄","쿠","큐","크","키","캐","콰","쾌","퀘","퀴"]
    let word_l = ["타","탸","터","텨","토","툐","투","튜","트","티","태","테","퇴","퉤","튀"]
    let word_m = ["파","퍄","퍼","펴","포","표","푸","프","피","패","페"]
    let word_n = ["하","햐","허","혀","호","효","후","휴","흐","히","해", "헤","화","회","훠","휘","희"]
    let word_o = ["까","꺄","꺼","껴","꼬","꾸","끄","끼","깨","께","꽈","꽤","꾀","꿔","꿰","뀌"]
    let word_p = ["따","떠","또","뚜","뜨","띠","때","떼","똬","뙤","뛰","띄"]
    let word_q = ["빠","뻐","뼈","뽀","뾰","뿌","쁘","삐", "빼"]
    let word_r = ["싸","써","쏘","쑈","쓰","씨","쌔","쎄","쏴","쐐","쐬","쒀"]
    let word_s = ["짜","쩌","쪄","쪼","쭈","쮸","찌","째","쫘","쬐"]
    
    let pronunciation_a = ["(ga)","(gya)","(geo)","(gyeo)","(go)","(gyo)","(gu)","(gyu)","(geu)","(gi)","(gae)","(gyae)","(ge)","(gye)","(gwa)","(gwae)","(goe)","(gwo)","(gwe)","(gwi)"]
    let pronunciation_b = ["(na)","(nya)","(neo)","(nyeo)","(no)","(nyo)","(nu)","(nyu)","(neu)","(ni)","(nae)","(ne)","(noe)"]
    let pronunciation_c = ["(da)","(dya)","(deo)","(dyeo)","(do)","(dyo)","(du)","(dyu)","(deu)","(di)","(dae)","(de)","(dwae)","(doe)","(dwo)","(dwi)"]
    let pronunciation_d = ["(ra)","(rya)","(reo)","(ryeo)","(ro)","(ryo)","(ru)","(ryu)","(reu)","(ri)","(rae)","(re)","(roe)"]
    let pronunciation_e = ["(ma)","(mya)","(meo)","(myeo)","(mo)","(myo)","(mu)","(myu)","(meu)","(mi)","(mae)","(me)","(moe)"]
    let pronunciation_f = ["(ba)","(bya)","(beo)","(byeo)","(bo)","(byo)","(bu)","(byu)","(beu)","(bi)","(bae)","(be)","(bwa)","(bwae)","(boe)"]
    let pronunciation_g = ["(sa)","(sya)","(seo)","(syeo)","(so)","(syo)","(su)","(syu)","(seu)","(si)","(sae)","(se)","(soe)","(swi)"]
    let pronunciation_h = ["(a)","(ya)","(eo)","(yeo)","(o)","(yo)","(u)","(yu)","(eu)","(i)","(ae)","(yae)","(e)","(ye)","(wa)","(wae)","(oe)","(wo)","(we)","(wi)","(yi)" ]
    let pronunciation_i = ["(ja)","(jya)","(jeo)","(jyeo)","(jo)","(jyo)","(ju)","(jyu)","(jeu)","(ji)","(jae)","(jyae)","(je)","(jwa)","(joe)","(jwi)"]
    let pronunciation_j = ["(cha)","(chya)","(cheo)","(chyeo)","(cho)","(chyo)","(chu)","(chyu)","(cheu)","(chi)","(chae)","(che)","(choe)","(chwe)","(chwi)"]
    let pronunciation_k = ["(ka)","(kya)","(keo)","(kyeo)","(ko)","(kyo)","(ku)","(kyu)","(keu)","(ki)","(kae)","(kwa)","(kwae)","(kwe)","(kwi)"]
    let pronunciation_l = ["(ta)","(tya)","(teo)","(tyeo)","(to)","(tyo)","(tu)","(tyu)","(teu)","(ti)","(tae)","(te)","(toe)","(twe)","(twi)"]
    let pronunciation_m = ["(pa)","(pya)","(peo)","(pyeo)","(po)","(pyo)","(pu)","(peu)","(pi)","(pae)","(pe)"]
    let pronunciation_n = ["(ha)","(hya)","(heo)","(hyeo)","(ho)","(hyo)","(hu)","(hyu)","(heu)","(hi)","(hae)","(he)","(hwa)","(hoe)","(hwo)","(hwi)","(hyi)"]
    let pronunciation_o = ["(gga)","(ggya)","(ggeo)","(ggyeo)","(ggo)","(ggu)","(ggeu)","(ggi)","(ggae)","(gge)","(ggwa)","(ggwae)","(ggoe)","(ggwo)","(ggwe)","(ggwi)"]
    let pronunciation_p = ["(dda)","(ddeo)","(ddo)","(ddu)","(ddeu)","(ddi)","(ddae)","(dde)","(ddwa)","(ddoe)","(ddwi)","(ddyi)"]
    let pronunciation_q = ["(bba)","(bbeo)","(bbyeo)","(bbo)","(bbyo)","(bbu)","(bbeu)","(bbi)","(bbae)"]
    let pronunciation_r = ["(ssa)","(sseo)","(sso)","(ssyo)","(sseu)","(ssi)","(ssae)","(sse)","(sswa)","(sswae)","(ssoe)","(sswo)"]
    let pronunciation_s = ["(jja)","(jjeo)","(jjyeo)","(jjo)","(jju)","(jjyu)","(jji)","(jjae)","(jjwa)","(jjeo)"]
    
    let sound_a = ["A1","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","A12","A13","A14","A15","A16","A17","A18","A19","A20"]
    let sound_b = ["B1","B2","B3","B4","B5","B6","B7","B8","B9","B10","B11","B12","B13"]
    let sound_c = ["C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16"]
    let sound_d = ["D1","D2","D3","D4","D5","D6","D7","D8","D9","D10","D11","D12","D13"]
    let sound_e = ["E1","E2","E3","E4","E5","E6","E7","E8","E9","E10","E11","E12","E13"]
    let sound_f = ["F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12","F13","F14","F15"]
    let sound_g = ["G1","G2","G3","G4","G5","G6","G7","G8","G9","G10","G11","G12","G13","G15","G15"]
    let sound_h = ["H1","H2","H3","H4","H5","H6","H7","H8","H9","H10","H11","H12","H13","H14","H15","H16","H17","H18","H19","H20","H21"]
    let sound_i = ["I1","I2","I3","I4","I5","I6","I7","I8","I9","I10","I11","I12","I13","I14","I15","I16"]
    let sound_j = ["J1","J2","J3","J4","J5","J6","J7","J8","J9","J10","J11","J12","J13","J14","J15"]
    let sound_k = ["K1","K2","K3","K4","K5","K6","K7","K8","K9","K10","K11","K13","K14","K15","K16","K16"]
    let sound_l = ["L1","L2","L3","L4","L5","L6","L7","L8","L9","L10","L11","L12","L13","L14","L15"]
    let sound_m = ["M1","M2","M3","M4","M5","M6","M7","M9","M10","M11","M12"]
    let sound_n = ["N1","N2","N3","N4","N5","N6","N7","N8","N9","N10","N11","N12","N13","N14","N15","N16","N17"]
    let sound_o = ["O1","O2","O3","O4","O5","O7","O8","O9","O10","O11","O12","O13","O14","O15","O13","O16"]
    let sound_p = ["P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12"]
    let sound_q = ["Q1","Q2","Q3","Q4","Q5","Q6","Q7","Q8","Q9"]
    let sound_r = ["R1","R2","R3","R4","R5","R6","R7","R8","R9","R10","R11","R12"]
    let sound_s = ["S1","S2","S3","S4","S5","S6","S7","S8","S9","S10"]
    
    var seletwordArray: Array<String> = []
    var seletPronunciationArray: Array<String> = []
    var seletSountArray: Array<String> = []
    
    @IBOutlet weak var wordView: UIView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordSubLabel: UILabel!
    
    @IBOutlet weak var writeView1: WordView!
    @IBOutlet weak var writeView2: WordView!
    @IBOutlet weak var writeView3: WordView!
    @IBOutlet weak var writeView4: WordView!
    
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var clearBtn: UIButton!
    
    var player: AVAudioPlayer?
    
    var soundFileName: String = ""
    
    var _selectedNum = 0
    var maxCount = 0
    
    var selectedNum: Int {
        get {
            return _selectedNum
        }
        
        set {
            _selectedNum = newValue
            soundFileName = seletSountArray[newValue]
        }
    }
    
    public var selectWord = 0
    public var selectDetailWord = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        writeView1.delegate = self
        writeView2.delegate = self
        writeView3.delegate = self
        writeView4.delegate = self
        
        switch selectWord {
        case 0:  seletwordArray = word_a; seletPronunciationArray = pronunciation_a; seletSountArray = sound_a;  break
        case 1:  seletwordArray = word_b; seletPronunciationArray = pronunciation_b; seletSountArray = sound_b;  break
        case 2:  seletwordArray = word_c; seletPronunciationArray = pronunciation_c; seletSountArray = sound_c;  break
        case 3:  seletwordArray = word_d; seletPronunciationArray = pronunciation_d; seletSountArray = sound_d;  break
        case 4:  seletwordArray = word_e; seletPronunciationArray = pronunciation_e; seletSountArray = sound_e;  break
        case 5:  seletwordArray = word_f; seletPronunciationArray = pronunciation_f; seletSountArray = sound_f;  break
        case 6:  seletwordArray = word_g; seletPronunciationArray = pronunciation_g; seletSountArray = sound_g;  break
        case 7:  seletwordArray = word_h; seletPronunciationArray = pronunciation_h; seletSountArray = sound_h;  break
        case 8:  seletwordArray = word_i; seletPronunciationArray = pronunciation_i; seletSountArray = sound_i;  break
        case 9:  seletwordArray = word_j; seletPronunciationArray = pronunciation_j; seletSountArray = sound_j;  break
        case 10: seletwordArray = word_k; seletPronunciationArray = pronunciation_k; seletSountArray = sound_k;  break
        case 11: seletwordArray = word_l; seletPronunciationArray = pronunciation_l; seletSountArray = sound_l;  break
        case 12: seletwordArray = word_m; seletPronunciationArray = pronunciation_m; seletSountArray = sound_m;  break
        case 13: seletwordArray = word_n; seletPronunciationArray = pronunciation_n; seletSountArray = sound_n;  break
        case 14: seletwordArray = word_o; seletPronunciationArray = pronunciation_o; seletSountArray = sound_o;  break
        case 15: seletwordArray = word_p; seletPronunciationArray = pronunciation_p; seletSountArray = sound_p;  break
        case 16: seletwordArray = word_q; seletPronunciationArray = pronunciation_q; seletSountArray = sound_q;  break
        case 17: seletwordArray = word_r; seletPronunciationArray = pronunciation_r; seletSountArray = sound_r;  break
        case 18: seletwordArray = word_s; seletPronunciationArray = pronunciation_s; seletSountArray = sound_s;  break
        default: break
        }
        
        selectedNum = selectDetailWord
        maxCount = seletwordArray.count
        setEnableBtn(num: selectedNum)
    }
    
    override func viewDidLayoutSubviews() {
        clearBtn.layer.cornerRadius = clearBtn.frame.size.height/2.0
        wordView.layer.cornerRadius = wordView.frame.size.height/2.0
        
        wordLabel.text = seletwordArray[selectedNum]
        wordSubLabel.text = seletPronunciationArray[selectedNum]
    }
    
    @IBAction func doClear(_ sender: Any) {
        writeViewClear()
    }
    
    func writeViewClear () {
        writeView1.setClear()
        writeView2.setClear()
        writeView3.setClear()
        writeView4.setClear()
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
            if soundFileName == "A17" {
                player.currentTime = 2.0
            } else if soundFileName == "A20" {
                player.currentTime = 2.0
            } else if soundFileName == "B1" {
                player.currentTime = 0.5
            } else if soundFileName == "B4" {
                player.currentTime = 1.5
            } else if soundFileName == "F15" {
                player.currentTime = 0.5
            } else if soundFileName == "J1" {
                player.currentTime = 0.5
            } else if soundFileName == "J8" {
                player.currentTime = 0.5
            } else if soundFileName == "L3" {
                player.currentTime = 2.0
            } else if soundFileName == "O10" {
                player.currentTime = 0.3
            } else if soundFileName == "R11" {
                player.currentTime = 0.3
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
            
            self.wordLabel.text = self.seletwordArray[self.selectedNum]
            self.wordSubLabel.text = self.seletPronunciationArray[self.selectedNum]
            
        } else {
            return
        }
    }
    
    @IBAction func wordNext(_ sender: Any) {
        
        writeViewClear()
        
        if selectedNum < maxCount {
            selectedNum += 1
            setEnableBtn(num: selectedNum)
            
            wordLabel.text = seletwordArray[selectedNum]
            wordSubLabel.text = seletPronunciationArray[selectedNum]
            
        } else {
            return
        }
    }

}

extension HangeulPracticeWriteViewController: WordViewwDelegate {
    func touchBeginView() {
        playSound()
    }
}
