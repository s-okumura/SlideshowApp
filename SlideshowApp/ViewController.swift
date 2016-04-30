//
//  ViewController.swift
//  SlideshowApp
//
//  Created by shogo on 4/30/16.
//  Copyright © 2016 shogo.okumura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    let photos = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
    var timer: NSTimer!
    var imageNum: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let image:UIImage! = UIImage(named: photos[imageNum])
        imageView.image = image;
        self.imageView.userInteractionEnabled = true
        let myTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        self.imageView.addGestureRecognizer(myTap)
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonTapped(sender: UIButton) {
        showNextImage()
    }

    @IBAction func previousButtonTapped(sender: UIButton) {
        imageNum -= 1
        if (imageNum < 0) {
            imageNum = photos.count - 1
        }
        imageView.image = UIImage(named: photos[imageNum])
    }

    @IBAction func startStopButtonTapped(sender: UIButton) {
        if(startStopButton.titleLabel?.text == "再生") {
            
            startStopButton.setTitle("停止", forState: UIControlState.Normal)
            
            if timer == nil || !timer.valid {
                // タイマー開始
                timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(ViewController.onUpdate(_:)), userInfo: nil, repeats: true)
                // ボタンを押してすぐに画像が切り替わるのを防ぐ
                // 単純にスリープさせるとタイトルの更新も遅くなるので以下の条件を追加
                if startStopButton.titleLabel?.text == "停止" {
                    sleep(2)
                    timer.fire()
                }
            }
            
        } else {
            
            startStopButton.setTitle("再生", forState: UIControlState.Normal)
            
            if timer.valid {
                // タイマー停止
                timer.invalidate()
            }
        }
    }

    // NSTimerIntervalで指定された秒数毎に呼び出される
    func onUpdate(timer : NSTimer){
        showNextImage()
    }

    func tapGesture(r:UITapGestureRecognizer){
        if (r.view as? UIImageView) != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let largeViewController = storyboard.instantiateViewControllerWithIdentifier("largeView") as! LargeViewController
                largeViewController.photoName = self.photos[imageNum]
            largeViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
            self.presentViewController(largeViewController, animated: true, completion: nil)

        }
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }

    func showNextImage() {
        imageNum += 1
        if (imageNum == photos.count) {
            imageNum = 0
        }
        imageView.image = UIImage(named: photos[imageNum])
    }

}

