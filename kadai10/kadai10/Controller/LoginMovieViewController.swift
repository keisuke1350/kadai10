//
//  LoginMovieViewController.swift
//  kadai10
//
//  Created by 葛西　佳祐 on 2020/07/12.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class LoginMovieViewController: UIViewController {
    
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "start", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))

        //AVPlayer用のレイヤーを生成
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_)in
            
            self.player.seek(to: .zero)
            self.player.play()

        }
        
        bannerView.adUnitID = "ca-app-pub-5106065156529384/9024405443"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func login(_ sender: Any) {
        player.pause()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
