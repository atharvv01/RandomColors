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
        
        for _ in 0..<60{
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*
         What this means is wherever my segue is pointing to thats what destVC is
         And we want access to that destination so that we can set the colour
         here we are casting this regular view controller so that colours detailvc can use
         this as a variable which normal vc cant
         */
        let destVC = segue.destination as! ColoursDetailViewController
        
        /*
         What this means is we are setting that colour as a sender's colour that we just passed in */
        destVC.color = sender as? UIColor
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
        
        /*
         Here we will create another variable colour and assign it with the value of which
         ever row is tapped
         */
        let colour = colours[indexPath.row]
        
        /*
         Here the sender for segue will be colours as we want to pass on the value of colour to
         next view controller so that it can render that colour
         */
        //here we are calling the function written above
        performSegue(withIdentifier: "ToColoursDetailVC", sender: colour)
    }
}
