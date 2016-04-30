//
//  LargeViewController.swift
//  SlideshowApp
//
//  Created by shogo on 4/30/16.
//  Copyright © 2016 shogo.okumura. All rights reserved.
//

import UIKit

class LargeViewController: UIViewController {

    var photoName:String = ""
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    var imageNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image:UIImage! = UIImage(named: photoName)
        largeImage.image = image;
        self.largeImage.userInteractionEnabled = true
        let myTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        self.largeImage.addGestureRecognizer(myTap)
        self.view.addSubview(largeImage)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
