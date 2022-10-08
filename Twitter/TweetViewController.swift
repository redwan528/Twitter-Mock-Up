//
//  TweetViewController.swift
//  Twitter
//
//  Created by Redwan Khan on 07/10/2022.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
    }


    @IBOutlet weak var tweetTextView: UITextView!
    
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: {(error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
                
            })

        }
           else{
            self.dismiss(animated: true, completion: nil)
                    }
    }
    
}
