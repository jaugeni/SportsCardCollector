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
    
    @IBOutlet weak var addUpdateBtn: UIButton!
    
    @IBOutlet weak var deleteOutlet: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    var card: Card? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if card != nil {
            imageView.image = UIImage(data: card?.image as! Data)
            titleTextFild.text = card!.title!
            addUpdateBtn.setTitle("Update", for: .normal)
            
        } else {
            
            deleteOutlet.isHidden = true
            
        }
        
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
        
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        if card != nil {
            
            card!.title = titleTextFild.text
            card!.image = UIImagePNGRepresentation(imageView.image!) as NSData?
            
        } else {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let card = Card(context: context)
            card.title = titleTextFild.text
            card.image = UIImagePNGRepresentation(imageView.image!) as NSData?
            
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(card!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
}
