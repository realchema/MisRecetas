//
//  ViewController.swift
//  MisRecetas
//
//  Created by Jose M Arguinzzones on 2019-01-10.
//  Copyright © 2019 Jose M Arguinzzones. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    /* si se utiliza un UIViewController hay que agregar
 UIViewController, UITableViewDataSource, UITableViewDelegate*/
    
    
    var recipes : [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //self.tableView.rowHeight = UITableView.automaticDimension
        
        navigationController?.hidesBarsOnSwipe = true
        
        var  recipe = Recipe (name: "Tortilla de patatas", image: #imageLiteral(resourceName: "tortilla"), time: 20, ingredients: ["Patatas" , "Huevos", "Cebollas"], steps : ["Pelas las patatas y las cebollas", "Cortar las patatas y la cebolla y sofreir", "Batir los huevos y echarlos durante 1 minuto a la sarten con el resto"])
        recipes.append(recipe)
        
        recipe = Recipe (name: "Pizza Margarita", image: #imageLiteral(resourceName: "pizza"), time: 60, ingredients: ["Harina", "Levadura", "Sal", "Salsa de Tomate", "Queso"], steps: ["Hacemos la masa con harina, levadura, aceite y sal", "Dejamos reposar la masa 30 minutos", "Extendemos la masa encima de una bandeja y añadimos el resto de ingredientes", "Hornear durante 12 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe (name: "Hamburguesas con queso", image: #imageLiteral(resourceName: "hamburguesa"), time: 10, ingredients: ["Pan de hamburguesa", "Lechuga", "Tomate", "Queso", "Carne de hamburguesa" ], steps: ["Poner al fuego la carne al gusto", "Montar la harburguesa con sus ingredientes entre los panes"])
        recipes.append(recipe)
        
        recipe = Recipe (name: "Ensalada Cesar", image: #imageLiteral(resourceName: "ensalada"), time: 15, ingredients: ["Lechuga", "Tomate", "Cebolla", "Pimientos", "Salsa Cesar", "Pollo" ], steps: ["Limpiar todas las verduras y trocearlas", "Cocer el pollo al gusto", "Juntar todos los ingredientes en una ensaladera y servir con la salsa cesar por encima"])
        recipes.append(recipe)
        
        recipe = Recipe (name: "Paella", image: #imageLiteral(resourceName: "paella"), time: 30, ingredients: ["Arroz Bomba", "Marisco variado", "Caldo de pescado", "Guisantes"], steps: ["Tostar el arroz en una paella", "Tras dorarse, echar el caldo de pescado, el marisco y los guisantes.", "Dejar cocer a fuego lento hasta que todo el arroz haya absorvido el caldo"])
        recipes.append(recipe)
        
        recipe = Recipe (name: "Batido de Fresas", image: #imageLiteral(resourceName: "smoothie"), time: 5, ingredients: ["10 fresas maduras", "Leche", "Azucar"], steps: ["Limpiar y cortar las fresas", "Mezclarlas con la leche y una cucharada de azucar", "Triturar hasta que quede hecho papilla."])
        recipes.append(recipe)
        
    }
    
    //MARK: - UITableViewDataSource
    
    
    //define cuantas secciones tiene la tabla return 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //define el numero total de filas en la tabla, (el numero total de recetas)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        
        let cellID = "RecipeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        
      
        
        //assigning the values to the  ui objects  on the screen
        cell.ThumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(String(describing: recipe.time!)) min"
        cell.ingredientLabel.text = "Ingredientes : \(recipe.ingredients.count)"
        
        // si la eceta es favorita le ponemos un check mark
       /* if recipe.isFavourite{
            cell.accessoryType = .checkmark
        } else { // to avoid de bug and make sure that checkmark is none (because the cell is reusanble)
            cell.accessoryType = .none
        }*/
       
        
        
       
        
             ///this is to change the border of the pictures "with code"
        //cell.ThumbnailImageView.layer.cornerRadius = 42.0
             ///cut everything on the corners
        //cell.ThumbnailImageView.clipsToBounds = true
        
        
        //////////////////////////////////////
    
        
        
        return cell
    }
    //this function is to slide to the left and have the opcion to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        //to reload the table and update it (in case of any deleted cell)
        //self.tableView.reloadData()
        
       //this option is more eficient because reload only the cell modifyed and not the entire table
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    //add more options when slide to the left
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //share action
        let shareAction = UITableViewRowAction(style: .normal, title: "Compartir") { (action, indexPath) in
        
            let shareDefaultText = "Estoy mirando la receta de \(String(describing: self.recipes[indexPath.row].name!)) en la app de recetas"
        
        let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
        
        self.present(activityController, animated: true, completion: nil)
        }
        
        //delete button
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Borrar") {(action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [shareAction, deleteAction]
        
    }
   
    //MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //to add a name to the alert title
        /*let recipe  = self.recipes[indexPath.row]
        
        let alertController = UIAlertController (title: recipe.name , message: "Valora este plato", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        
        var favoriteActionTitle = "Favorito"
        var favoriteActionStyle = UIAlertAction.Style.default
        if recipe.isFavourite{
            favoriteActionTitle = "No Favorita"
            favoriteActionStyle = UIAlertAction.Style.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favoriteActionTitle, style: favoriteActionStyle){(ACTION) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            
            //to refresh the table and reload the table
            self.tableView.reloadData()
        }
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil)*/
        
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"{
            
            if let indexpath = self.tableView.indexPathForSelectedRow{
                let selectedRecipe = self.recipes[indexpath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
    
   
   

}

