//
//  RankingViewController.swift
//  Barabaragame
//
//  Created by Yu Kono on 2021/05/15.
//

import UIKit

class RankingViewController: UIViewController {
    
    //スコアの表示
    @IBOutlet var rankingLabel1: UILabel!
    @IBOutlet var rankingLabel2: UILabel!
    @IBOutlet var rankingLabel3: UILabel!
    //トップに戻るボタン
    @IBAction func toTop(){
        self.dismiss(animated: true, completion: nil)
    }
    //スコアの保存の変数
    let defaults: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //score1とランキング1位を結びつける
            rankingLabel1.text = String(defaults.integer(forKey: "score1"))
            rankingLabel2.text = String(defaults.integer(forKey: "score2"))
            rankingLabel3.text = String(defaults.integer(forKey: "score3"))
        
        
  }
    
    
}



