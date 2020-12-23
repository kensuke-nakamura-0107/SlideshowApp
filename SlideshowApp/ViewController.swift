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

    override func viewDidLoad() {
        super.viewDidLoad()
        viewimage.image = pictures[0]
    }
    
    //画像をタップしたら遷移する
    @IBAction func onTapAction(_ sender: Any) {
        performSegue(withIdentifier: "TapAction", sender: nil)
    }
    //次画面に画像を引き継ぐ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.x = viewimage.image
    }

    //遷移先画面で戻るを押下すると戻る用
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

