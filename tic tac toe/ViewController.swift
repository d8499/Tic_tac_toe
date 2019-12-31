//
//  ViewController.swift
//  tic tac toe
//
//  Created by COE-028 on 11/09/19.
//  Copyright © 2019 COE-028. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //variable to keep track of turn of whom player :2
    var activePlayer = 1
    
    //variable to track location that can't be override
    //at initial is zero..
    var location = [0,0,0,0,0,0,0,0,0]
    
    //combinations :4
    let winningCombinatons = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    //game state :5
    var gameState =  true
    
    var count=0
    
    //now winnerlable, play again and its action at last then make it hidden in did load
    
    @IBOutlet weak var WinnerLabel: UILabel!
    
    @IBOutlet weak var PlayAgainButton: UIButton!
    
    @IBAction func PlayButtonAgain(_ sender: Any) {
         activePlayer = 1
         gameState =  true
        
        location = [0,0,0,0,0,0,0,0,0]
        for i in 1...9
        {
            if let button = view.viewWithTag(i) as? UIButton
            {
                button.setImage(nil, for: [])
                //both are hidden
                WinnerLabel.isHidden = true
                PlayAgainButton.isHidden = true
                
                //then move label &playbutton , so it can't affect button 0 to 9
                WinnerLabel.center = CGPoint(x:WinnerLabel.center.x-500,y:WinnerLabel.center.y)
                PlayAgainButton.center = CGPoint(x:PlayAgainButton.center.x-500,y:PlayAgainButton.center.y)
            }
        }
    }
    
    //button action :1
    @IBAction func btnAction(_ sender: UIButton)
    {
        //connect all ..
        
        //location having no image..
        if (location[sender.tag-1] == 0 && gameState == true)
        {
            //set data
            location[sender.tag-1] = activePlayer
        
        //if , else : 3
            if (activePlayer == 1)
            {
            sender.setImage(UIImage(named:"cross.png"), for: UIControlState())
            //set image and change turn of player
            activePlayer = 2
            
            
            }
            else
            {
            sender.setImage(UIImage(named:"nought.png"), for: UIControlState())
            activePlayer = 1
            }
        }
        
        //for checking array
        for combinatons in winningCombinatons
        {
            
            
            if (location[combinatons[0]] != 0 && location[combinatons[0]] == location[combinatons[1]] && location[combinatons[1]] == location[combinatons[2]])
            {
                //game should be closed: 6
                gameState = false
                //now visible
                WinnerLabel.isHidden = false
                PlayAgainButton.isHidden = false
                
                if activePlayer == 1
                {
                    //print("Nought win")
                    WinnerLabel.text = "Nought won 😇😇"
                }
                else
                {
                    //print("Cross win")
                    WinnerLabel.text = "Cross won 😇😇"
                }
              
                //bring them back
                if PlayAgainButton.isSelected == true{
                UIView.animate(withDuration: 1, animations: {
                    self.WinnerLabel.center=CGPoint(x:self.WinnerLabel.center.x + 500,y:self.WinnerLabel.center.y)
                    
                    self.PlayAgainButton.center=CGPoint(x:self.PlayAgainButton.center.x + 500,y:self.PlayAgainButton.center.y)}
            )
                
                }}
            
            
            
            
        }
        if ( location[0] != 0 && location[1] != 0 && location[2] != 0 && location[3] != 0 && location[3] != 0 && location[4] != 0 && location[5] != 0 && location[6] != 0 && location[7] != 0 && location[8] != 0  )
        {                //game should be closed: 6
            gameState = false
            //now visible
            WinnerLabel.isHidden = false
            PlayAgainButton.isHidden = false
            WinnerLabel.text = "Match tie: 🤔🤔"
            
            if PlayAgainButton.isSelected == true
            {
            UIView.animate(withDuration: 1, animations: {
                self.WinnerLabel.center=CGPoint(x:self.WinnerLabel.center.x + 500,y:self.WinnerLabel.center.y)
                
                self.PlayAgainButton.center=CGPoint(x:self.PlayAgainButton.center.x + 500,y:self.PlayAgainButton.center.y)}
            )
            
        }
        
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //both are hidden
        WinnerLabel.isHidden = true
        PlayAgainButton.isHidden = true
        
        //then move label &playbutton , so it cant affect button 0 to 9
        
        WinnerLabel.center = CGPoint(x:WinnerLabel.center.x-500,y:WinnerLabel.center.y)
        PlayAgainButton.center = CGPoint(x:PlayAgainButton.center.x-500,y:PlayAgainButton.center.y)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

