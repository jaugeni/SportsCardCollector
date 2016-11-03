//
//  CreatorCardVC.swift
//  SportsCardCollector
//
//  Created by YAUHENI IVANIUK on 11/3/16.
//  Copyright © 2016 be connected club inc. All rights reserved.
//

import UIKit

class CreatorCardVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleTextFild: UITextField!

    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }

    @IBAction func photoBtn(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func cameraBtn(_ sender: Any) {
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
    }
    
}
