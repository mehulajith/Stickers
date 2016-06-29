//
//  ViewController.swift
//  Sticker Madness
//
//  Created by Mehul Ajith on 6/28/16.
//  Copyright © 2016 Mehul Ajith. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet var imageView: SpringImageView!
    
    //MARK: Vars
    var imagePickerController: UIImagePickerController?
    
    var mustacheImageView: UIImageView?
    var glassesImageView: UIImageView?
    var hatImageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let animatedImageView: UIImageView = UIImageView(frame: self.view.bounds)
//        
//        
//        animatedImageView.animationImages = [UIImage(named: "image1.gif")!, UIImage(named: "image2.gif")!, UIImage(named: "image3.gif")!, UIImage(named: "image4.gif")!]
//        animatedImageView.animationDuration = 1.0
//        animatedImageView.animationRepeatCount = 0
//        animatedImageView.startAnimating()
//        self.view!.addSubview(animatedImageView)
//
 }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getPhoto(sender: UIButton) {
        
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        let photoLibraryAction = UIAlertAction(title: "Photo from Library", style: .Default) { (action) in
            
            self.showImagePickerController(.PhotoLibrary)
        }
        
        alertController.addAction(photoLibraryAction)
        
        if (UIImagePickerController.isCameraDeviceAvailable(.Front)) {
            let cameraAction = UIAlertAction(title: "Photo from Camera", style: .Default) { (action) in
                
                self.showImagePickerController(.Camera)
                
            }
            
            alertController.addAction(cameraAction)
        }
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // Show Controller
    func showImagePickerController(sourceType: UIImagePickerControllerSourceType) {
        imagePickerController = UIImagePickerController()
        imagePickerController!.sourceType = sourceType
        imagePickerController?.delegate = self
        self.presentViewController(imagePickerController!, animated: true, completion: nil)
        print("Running")
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.imageView.image = image
        print ("got Image!")
    }
    
//    STICKERS!!
    
    @IBAction func glasses(sender: UIButton) {
            
            let glassesStik = Stickers(image:UIImage(named: "eyeglasses1"))
            self.view.addSubview(glassesStik)
        
//        let screenSize: CGRect = UIScreen.mainScreen().bounds
//        
//        let screenWidth = screenSize.width / 2
//        let screenHeight = screenSize.height / 2
//        
//        let mustacheImage : UIImage = UIImage(named:"eyeglasses1")!
//        glassesImageView = UIImageView(image: mustacheImage)
//        glassesImageView!.image = mustacheImage
//        glassesImageView!.frame = CGRect(x: screenWidth/2, y: screenHeight/2, width: mustacheImage.size.width/2, height: mustacheImage.size.height/2)
//        self.view.addSubview(glassesImageView!)
        
    }
    
    @IBAction func mustache(sender: UIButton) {
            
            let mustacheStik = Stickers(image:UIImage(named: "mustache3"))
            self.view.addSubview(mustacheStik)
        
//        let screenSize: CGRect = UIScreen.mainScreen().bounds
//        
//        let screenWidth = screenSize.width / 2
//        let screenHeight = screenSize.height / 2
//        
//        let mustacheImage : UIImage = UIImage(named:"Mustache1")!
//        mustacheImageView = UIImageView(image: mustacheImage)
//        mustacheImageView!.image = mustacheImage
//        mustacheImageView!.frame = CGRect(x: screenWidth/2, y: screenHeight/2, width: mustacheImage.size.width/2, height: mustacheImage.size.height/2)
//        self.view.addSubview(mustacheImageView!)
     
    }
    
    @IBAction func hat(sender: UIButton) {
        
//        hatImageView?.image = nil
            
            let hatStik = Stickers(image:UIImage(named: "hat1"))
            self.view.addSubview(hatStik)
            
            
        
//            let screenSize: CGRect = UIScreen.mainScreen().bounds
//            
//            let screenWidth = screenSize.width / 2
//            let screenHeight = screenSize.height / 2
//            
//            let mustacheImage : UIImage = UIImage(named:"hat1")!
//            hatImageView = UIImageView(image: mustacheImage)
//            hatImageView!.image = mustacheImage
//            hatImageView!.frame = CGRect(x: screenWidth/2, y: screenHeight/2, width: mustacheImage.size.width/2, height: mustacheImage.size.height/2)
//            self.view.addSubview(hatImageView!)
        

    
    }
    
    
    

    
    
    
}


