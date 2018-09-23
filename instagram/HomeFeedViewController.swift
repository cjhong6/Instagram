//
//  HomeFeedViewController.swift
//  instagram
//
//  Created by Chengjiu Hong on 9/20/18.
//  Copyright © 2018 Chengjiu Hong. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var posts: [PFObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let query = Post.query()
        query?.order(byDescending: "createAt")
        query?.includeKey("author")
        query?.limit = 20
        
        query?.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let posts = posts {
                self.posts = posts
                
            }
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        cell.instagramPost = posts[indexPath.row]
        return cell
    }

}
