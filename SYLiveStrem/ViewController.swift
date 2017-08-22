//
//  ViewController.swift
//  SYLiveStrem
//
//  Created by 郝松岩 on 2017/8/22.
//  Copyright © 2017年 hsy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var live : SYCell!
    var playerView :UIView!
    var ijkPlayer :IJKMediaPlayback!
    
    @IBOutlet weak var btnGift: UIButton!
    @IBOutlet weak var btnVote: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imgBack: UIImageView!
    
    @IBAction func tapBack(_ sender: Any) {
        ijkPlayer.shutdown()
        
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func tapGift(_ sender: UIButton) {
    }
    
    @IBAction func tapVote(_ sender: UIButton) {
        
        let heart = DMHeartFlyView(frame:CGRect(x:0,y:0,width:40,height:40))
        heart.center = CGPoint(x: btnVote.frame.origin.x, y: btnVote.frame.origin.y)
        view.addSubview(heart)
        heart.animate(in: view)
        //爱心按钮的关键帧动画
        let btnAnime = CAKeyframeAnimation(keyPath: "transfrom.scale")
        btnAnime.values = [1.0,0.9,0.8,0.7,0.6,0.6,0.7,0.8,0.9,1.0]
        btnAnime.keyTimes = [0.0,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
        btnAnime.duration = 0.2
        sender.layer.add(btnAnime,forKey:"SHOW")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBg()
        
        setPlayerView()
        
        bringToFront()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        imgBack .removeFromSuperview()
        
        if !self.ijkPlayer.isPlaying() {
            ijkPlayer.prepareToPlay()
        }
    }
    
    func setPlayerView() {
        self.playerView = UIView(frame:view.bounds)
        view.addSubview(self.playerView)
        
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        let pv = ijkPlayer.view!
        pv.frame = playerView.bounds
        pv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        playerView.insertSubview(pv, at: 1)
        ijkPlayer.scalingMode = .aspectFill
        
        
    }
    func bringToFront()  {
        view.bringSubview(toFront: btnBack)
        view.bringSubview(toFront: btnVote)
        view.bringSubview(toFront: btnGift)

    }
    func setBg() {
        let imageUrl = URL(string:live.portrait)
        imgBack.kf.setImage(with: imageUrl)
        
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect:blurEffect)
        effectView.frame = imgBack.frame
        imgBack.addSubview(effectView)
        
        
    }
   

}

