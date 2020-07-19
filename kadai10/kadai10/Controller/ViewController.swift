//
//  ViewController.swift
//  kadai10
//
//  Created by 葛西　佳祐 on 2020/07/12.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var onboardArray = ["1","2","3","4","5","6","7"]
    
    var onboardStringArray = ["ニュースをリアルタイムで取得するアプリです",
        "世界中のニュースをこのアプリ1本で確認できます",
        "他言語での取得設定も可能です",
        "youtubeでニュースを見ることも可能です",
        "さあ、始めよう！"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //ページが1枚ずつ切り替わる
        scrollView.isPagingEnabled = true
        setUpScroll()
        
        for i in 0...4 {
            let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
            animationView.frame = CGRect(x: CGFloat(i)*view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            //画像配置をコードで指定
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUpScroll(){
        scrollView?.delegate = self
        scrollView?.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        for i in 0...4{
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: view.frame.size.height/3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onboardLabel)
            
        }
    }


}

