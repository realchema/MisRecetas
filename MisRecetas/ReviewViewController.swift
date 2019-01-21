//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by Jose M Arguinzzones on 2019-01-18.
//  Copyright © 2019 Jose M Arguinzzones. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    var ratingSelected : String?
    
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var ratinBadBTN: UIButton!
    @IBOutlet var ratingGoodBTN: UIButton!
    @IBOutlet var ratingAwesomeBTN: UIButton!
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let blurEfect = UIBlurEffect(style: .dark)
        let blurEffectview = UIVisualEffectView(effect: blurEfect)
        blurEffectview.frame = view.bounds
        backgroundImageView.addSubview(blurEffectview)
        
        ratinBadBTN.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
         ratingGoodBTN.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
         ratingAwesomeBTN.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        /*UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
            self.ratinBadBTN.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.ratingGoodBTN.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.ratingAwesomeBTN.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)*/
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.ratinBadBTN.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.ratingGoodBTN.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.ratingAwesomeBTN.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    
    
    @IBAction func ratingBadBTN(_ sender: UIButton) {
        
        ratingSelected = "No me gusta"
    }
    
    @IBAction func ratingGoodBTN(_ sender: UIButton) {
        
        ratingSelected = "Me gusta"
    }
    @IBAction func ratingAwesomeBTN(_ sender: UIButton) {
        
        ratingSelected = "Me encanta"
    }
    
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
