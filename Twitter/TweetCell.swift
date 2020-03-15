//
//  TweetCell.swift
//  Twitter
//
//  Created by Aryan Khadiri on 3/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    var tweetId:Int!
    @IBAction func reTweet(_ sender: Any) {
        if(!retweeted){
            TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
                self.setRetweet(true)
            }, failure: { (Error) in
                print("There was an error retweeting!\(Error)")
            })
        }
        else{
            TwitterAPICaller.client?.unreTweet(tweetId: tweetId, success: {
                self.setRetweet(false)
            }, failure: { (Error) in
                print("There was an error unretweetin!\(Error)")
            })
        }
        
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        if (favorited){
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorit(false)
                
            }, failure: { (Error) in
                print("There was an error favoriting the tweet\(Error)")
            })
        }
        else{
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorit(true)
            }, failure: { (Error) in
                print("There was an error making the tweet unfavorited!\(Error)")
            })
        }
    }
    var retweeted:Bool = false
    var favorited:Bool = false
    
    func setRetweet(_ isRetweeted:Bool){
        retweeted = isRetweeted
        if(retweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
        }
        else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
        }
    }
    func setFavorit(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
