//
//  ViewController.swift
//  Photos
//
//  Created by Grant Maloney on 10/12/18.
//  Copyright © 2018 Grant Maloney. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func showCamera(_ sender: Any) {
        if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerController.CameraDevice.front)
            && UIImagePickerController.isCameraDeviceAvailable(UIImagePickerController.CameraDevice.rear) {
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            present(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Camera", message: "This device has no camera.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func openImages(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: { () in
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
                print("No image found")
                return
            }
            
            self.imageView.image = image
        })
    }

}

