//
//  TweetViewController.swift
//  Twitter
//
//  Created by Aryan Khadiri on 3/14/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetField: UITextView!
    @IBAction func Cancle(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func Create(_ sender: Any) {
        let content = tweetField.text!
        if (!content.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: content, success: {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetField.becomeFirstResponder()

        // Do any additional setup after loading the view.
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
