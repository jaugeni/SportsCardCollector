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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraBtn(_ sender: Any) {
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let card = Card(context: context)
        card.title = titleTextFild.text
        card.image = UIImagePNGRepresentation(imageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    
        
        
    }
    
}
