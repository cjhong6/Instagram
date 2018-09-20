//
//  Post.swift
//  instagram
//
//  Created by Chengjiu Hong on 9/19/18.
//  Copyright © 2018 Chengjiu Hong. All rights reserved.
//

import UIKit
import Parse

class Post: PFObject, PFSubclassing {
    @NSManaged var media:PFFile
    @NSManaged var author:PFUser
    @NSManaged var caption:String
    @NSManaged var likeCount:Int
    @NSManaged var commentCount:Int
    
    /* Needed to implement PFSubclassing interface */
    class func parseClassName() -> String {
        return "Post"
    }
    
    class func postUserImage(image: UIImage?, withCaption caption: String?) {
        // use subclass approach
        let post = Post()
        
        // Add relevant fields to the object
        post.media = getPFFileFromImage(image: image)! // PFFile column type
        post.author = PFUser.current()! // Pointer column type that points to PFUser
        post.caption = caption!
        post.likeCount = 0
        post.commentCount = 0
        
        // Save object (following function will save the object in Parse asynchronously)
        //post.saveInBackground(block: completion)
        post.saveInBackground(block: { (success, error) in
            if let error = error {
                print(error.localizedDescription)
            }else {
                print("Image uploaded")
            }
        })
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}
