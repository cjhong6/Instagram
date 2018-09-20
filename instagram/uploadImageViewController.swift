//
//  uploadImageViewController.swift
//  instagram
//
//  Created by Chengjiu Hong on 9/18/18.
//  Copyright © 2018 Chengjiu Hong. All rights reserved.
//

import UIKit

class uploadImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var captionField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Implement the delegate method
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //set the image captured by the UIImagePickerController
        //uploadImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //Parse has a limit of 10MB for uploading photos so you'll want to the code snippet below to resize the image before uploading to Parse.
       uploadImage.image = info[UIImagePickerControllerEditedImage] as! UIImage?
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selectImage(_ sender: Any) {
        //Instantiate a UIImagePickerController
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onUpload(_ sender: Any) {
        Post.postUserImage(image: uploadImage.image, withCaption: captionField.text)
    }

}
