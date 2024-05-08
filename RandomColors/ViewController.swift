//
//  ViewController.swift
//  RandomColors
//
//  Created by Atharva Zanwar on 07/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    var colours : [UIColor] = []
    
    //this is called as soon as screen is loaded into memory
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColours()
    }
   
    func addRandomColours(){
        
        for _ in 0..<50{
            colours.append(chooseRandomColour())
        }
    }
    
    func chooseRandomColour() -> UIColor {
        let randomColour = UIColor(red: CGFloat.random(in: 0...1),
                                   green: CGFloat.random(in: 0...1),
                                   blue: CGFloat.random(in: 0...1),
                                   alpha: 1)
        return randomColour
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
         here this is used to render the same cells seen on the screen with different values as you scroll,
         but since it dequeueReusableCell returns a optional we will use gaurd to unwrap it
         */
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColourCell") else{
            return UITableViewCell()
        }
        
        /* 
         here we are assinging colour with all the colours in array
         but instead of hardcoding it we used indexpath.row
         here even tho not all 50 cells are rendered indexpath.row means this delegate knows what no of row currently is being used
         */
        let colour = colours[indexPath.row]
        
        //assignig that colour to cell
        cell.backgroundColor = colour
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToColoursDetailVC", sender: nil)
    }
}
