//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Qingzhi Luo on 3/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetsContent: UILabel!
    

    @IBOutlet weak var retweetButton: UIButton!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFav = !favorited
        if(toBeFav) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, sucess: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Failed: \(error)")
            })
        }else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, sucess: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite Faild: \(error)")
            })
        }
        
        
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.rewweet(tweetId: tweetId, sucess: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting:\(error)")
        })
        
        
    }
    
    func setRetweeted(_ isRetweeted:Bool)
    {
        if(isRetweeted)
        {
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else
        {
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    var favorited:Bool = false
    var tweetId: Int = -1
  
    
    
    
    func setFavorite(_ isFavorited:Bool)
    {
        favorited = isFavorited
        if(favorited)
        {
            favButton.setImage(UIImage(named:"favor-icon-red"),for: UIControl.State.normal)
        }
        else {
            favButton.setImage((UIImage(named: "favor-icon")), for: UIControl.State.normal)
        }
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
