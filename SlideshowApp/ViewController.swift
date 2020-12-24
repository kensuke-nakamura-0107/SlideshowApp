//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村憲佑 on 2020/12/23.
//  Copyright © 2020 kensuke.nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //スライドショーフィールド
    @IBOutlet weak var viewimage: UIImageView!
    //再生ボタン
    @IBOutlet weak var start_button: UIButton!
    //次へボタン
    @IBOutlet weak var next_button: UIButton!
    //前へボタン
    @IBOutlet weak var pre_button: UIButton!
    // 画像を配列で取り込む（画像は7つセット）
     let pictures = [UIImage(named: "a_1"),UIImage(named: "a_2"),UIImage(named: "a_3"),UIImage(named: "a_4"),UIImage(named: "a_5"),UIImage(named: "a_6"),UIImage(named: "a_7")]
     // 画像配列からデータ取り出す用変数（0-6）
     var pcount:Int = 0
     // タイマー（スライド再生用）
     var timer: Timer!
     var timer_sec: Int = 0
     var on_off_fg: Int = 1
    // スライドショー中に画像タップで戻ってきた時用の変数
     var return_fg = 0
    
    // 初期表示
    override func viewDidLoad() {
        super.viewDidLoad()
        viewimage.image = pictures[0]
    }
    // 次へボタンアクション
    @IBAction func next_action(_ sender: Any) {
        pcount += 1
        pcount %= 7
        viewimage.image = pictures[pcount]
        viewimage.contentMode = UIView.ContentMode.scaleAspectFill
    }
    // 前へボタンアクション
    @IBAction func pre_action(_ sender: Any) {
        if pcount >= 1 {
               pcount -= 1
               pcount %= 7
               viewimage.image = pictures[pcount]
               }
               else {
                   pcount += 6
                   pcount %= 7
                   viewimage.image = pictures[pcount]
                   viewimage.contentMode = UIView.ContentMode.scaleAspectFill
               }
    }
    //再生ボタンアクション
    @IBAction func slideshow(_ sender: Any) {
        if (return_fg == 1){
            on_off_fg += 1
        }
        on_off_fg += 1
        on_off_fg %= 2
        return_fg = 0
        //再生する
        if (on_off_fg == 0) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
            if (self.timer == nil)  {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(Change_img(_:)), userInfo: nil, repeats: true)
               start_button.setTitle("停止", for: .normal)
               pre_button.isEnabled = false
               next_button.isEnabled = false
               pre_button.setTitleColor(UIColor.gray, for: .normal)
               next_button.setTitleColor(UIColor.gray, for: .normal)
                  }
        }
        //停止する
        else if (on_off_fg == 1) {
                self.timer.invalidate()   // タイマーを停止する
                self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
                start_button.setTitle("再生", for: .normal)
                pre_button.isEnabled = true
                next_button.isEnabled = true
                pre_button.setTitleColor(UIColor.link, for: .normal)
                next_button.setTitleColor(UIColor.link, for: .normal)
            }
    }
    //タイマーに応じて画像を切り替える
    @objc func Change_img(_ timer: Timer) {
        pcount += 1
        pcount %= 7
        viewimage.image = pictures[pcount]
        viewimage.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    //画像をタップしたら遷移する
    @IBAction func onTapAction(_ sender: Any) {
        performSegue(withIdentifier: "TapAction", sender: nil)
    }
    
    //次画面に画像を引き継ぐ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (self.timer !== nil)  {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
            start_button.setTitle("再生", for: .normal)
            pre_button.isEnabled = true
            next_button.isEnabled = true
            pre_button.setTitleColor(UIColor.link, for: .normal)
            next_button.setTitleColor(UIColor.link, for: .normal)
            return_fg = 1
        }
        //画像を引き継ぐ
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.x = viewimage.image
    }
    //遷移先画面で戻るを押下すると戻る用
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

