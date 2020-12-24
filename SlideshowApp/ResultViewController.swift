//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 中村憲佑 on 2020/12/23.
//  Copyright © 2020 kensuke.nakamura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //拡大画像フィールド
    @IBOutlet weak var largeimage: UIImageView!
    
    //仮でxに値を入れておく
    var x = UIImage(named: "a_1")
    
    //前画面から引き継いだ値を入れる
    override func viewDidLoad() {
        super.viewDidLoad()
        largeimage.image = x
        largeimage.contentMode = UIView.ContentMode.scaleAspectFill
    }
}
