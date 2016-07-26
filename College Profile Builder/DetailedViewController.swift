//
//  DetailedViewController.swift
//  College Profile Builder
//
//  Created by Stanley Stout on 7/25/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit
import SafariServices

class DetailedViewController: UIViewController,SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var websiteTextField: UITextField!
    
    
    var college = College()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = String(college.enrollment)
        imageView.image = college.image
        websiteTextField.text = college.website
        imagePicker.delegate = self
        
    }
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = collegeTextField.text!
        college.location = locationTextField.text!
        college.enrollment = Int(enrollmentTextField.text!)!
        college.image = imageView.image
        college.website = websiteTextField.text!
    }
    @IBAction func openSchoolWebsite(sender: UIButton) {
        let url = NSURL(string: college.website)
        let svc = SFSafariViewController(URL: url!)
        presentViewController(svc, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    @IBAction func photoLibraryButton(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cameraButton(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
}
