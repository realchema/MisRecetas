//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by Jose M Arguinzzones on 2019-01-18.
//  Copyright © 2019 Jose M Arguinzzones. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var receiveImageView: UIImageView!
    
    @IBOutlet var ratingBTN: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    
    
    var recipe : Recipe!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = self.recipe.name
        
     
        
        self.receiveImageView.image = self.recipe.image
        
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.40)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
       
       // self.timeLabel.text = "\(String(describing: recipe.time!)) min"
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
        let image = UIImage(named: self.recipe.rating)
        self.ratingBTN.setImage( image, for: .normal)
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        
        if let reviewVC = segue.source as? ReviewViewController{
            
          
                if let rating = reviewVC.ratingSelected {
                    self.recipe.rating = rating
                    let image = UIImage(named: self.recipe.rating)
                    self.ratingBTN.setImage(image, for: .normal)
                }
            
        }
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


extension DetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre:"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "Tiempo:"
                cell.valueLabel.text = "\(self.recipe.time!) min"
                /*case 2:
                 cell.keyLabel.text = "Favorita: "
                 if self.recipe.isFavourite {
                 cell.valueLabel.text = "Si"
                 } else {
                 cell.valueLabel.text = "No"
                 }*/
            default:
                break
            }
            
        case 1:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Ingredientes:"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Pasos:"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        
        
        return cell
        
    }
    
}

extension DetailViewController : UITableViewDelegate {
    
}
