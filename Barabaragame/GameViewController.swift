//
//  GameViewController.swift
//  Barabaragame
//
//  Created by Yu Kono on 2021/05/15.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView! //ばらばらの画像
    
    @IBOutlet var resultLabel : UILabel!
    
    var timer:Timer! //時間設定
    var score:Int = 1000 //スコア基本値
    let defaults: UserDefaults = UserDefaults.standard //スコア保存の変数
    
    let width:CGFloat = UIScreen.main.bounds.size.width //画面の幅　iphoneの画面サイズを取得する
    var positionX:[CGFloat] = [0.0,0.0,0.0]//画像の位置の配列 (同じものを使う時のまとめ)
    var dx:[CGFloat]=[1.0,0.5,-1.0]//動かす幅の配列　横に動かすのでx
    
    func start(){
        //結果ラベルを隠す
        resultLabel.isHidden = true
        //タイマーを作動させる準備
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil , repeats: true)
        //動かす
        timer.fire()
    }
    
    //upメソッドを作る
    @objc func up(){
        for i in 0..<3{
            //画面の端に到達したら逆方向に動かす
            if positionX[i] > width || positionX[i] < 0{
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i] //画像の位置をdx分だけずらす
        }
        //上の画像をずらした位置に移動させる
        imgView1.center.x = positionX[0]
        imgView2.center.x = positionX[1]
        imgView3.center.x = positionX[2]
    }
    
    //stopメソッドを作る
    @IBAction func stop(){
        //もしタイマーが動いていたら無効にする
        if timer.isValid == true{
            timer.invalidate()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2,width/2,width/2]//画像の位置を画面幅の中心にする
        self.start() //スタートメソッドを呼び出す
    }
    
 
    

   

}
