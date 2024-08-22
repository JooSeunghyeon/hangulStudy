//
//  HangeulPracticeDetailViewController.swift
//  HangulStudy
//
//  Created by EAN on 25/10/2019.
//  Copyright © 2019 EAN. All rights reserved.
//

import UIKit

class HangeulPracticeDetailViewController: UIViewController {

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
    
    public var selectWord: Int = 0
    var seletArray: Array<Any> = []
    var selectDetailWord: Int = 0
    
    @IBOutlet var btnCollection:[UIButton]!
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        switch selectWord {
        case 0: seletArray = word_a; break
        case 1: seletArray = word_b; break
        case 2: seletArray = word_c; break
        case 3: seletArray = word_d; break
        case 4: seletArray = word_e; break
        case 5: seletArray = word_f; break
        case 6: seletArray = word_g; break
        case 7: seletArray = word_h; break
        case 8: seletArray = word_i; break
        case 9: seletArray = word_j; break
        case 10: seletArray = word_k; break
        case 11: seletArray = word_l; break
        case 12: seletArray = word_m; break
        case 13: seletArray = word_n; break
        case 14: seletArray = word_o; break
        case 15: seletArray = word_p; break
        case 16: seletArray = word_q; break
        case 17: seletArray = word_r; break
        case 18: seletArray = word_s; break
        default: break
            
        }
        
        let logo = UIImage(named: "AIntroImage")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

    }
    
    override func viewDidLayoutSubviews() {
        
        wordView.layer.cornerRadius = wordView.frame.size.height/2.0
        
        for btn in btnCollection {
            btn.layer.cornerRadius = btn.frame.size.width/2.0
        }
        
        for btn in btnCollection {
            
            if btn.tag == 0 {
                wordLabel.text = seletArray[btn.tag] as? String
            }
            
            if btn.tag < seletArray.count {
                btn.setTitle(seletArray[btn.tag] as? String, for: .normal)
            } else {
                btn.backgroundColor = UIColor.white
            }
        }
    }

    @IBAction func moveToDetailView(btn: UIButton) {
        selectDetailWord = btn.tag
        self.performSegue(withIdentifier: "showHangeulWriteView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHangeulWriteView" {
            let vc = segue.destination as! HangeulPracticeWriteViewController
            vc.selectWord = selectWord
            vc.selectDetailWord = selectDetailWord
        }
    }

}
