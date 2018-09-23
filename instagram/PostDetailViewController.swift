//
//  PostDetailViewController.swift
//  instagram
//
//  Created by Chengjiu Hong on 9/23/18.
//  Copyright © 2018 Chengjiu Hong. All rights reserved.
//

import UIKit
import ParseUI

class PostDetailViewController: UIViewController {
    
    
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    var post : PFObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let post = post {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MMM-dd"
            let myString = formatter.string(from: post.createdAt!)
            timeLabel.text = myString
            
            captionLabel.text = post["caption"] as! String?
            postImageView.file = post["media"] as? PFFile
            postImageView.loadInBackground()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
