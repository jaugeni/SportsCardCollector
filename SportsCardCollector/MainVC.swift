//
//  Main.swift
//  SportsCardCollector
//
//  Created by YAUHENI IVANIUK on 11/3/16.
//  Copyright © 2016 be connected club inc. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tablView: UITableView!
    
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tablView.dataSource = self
        tablView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            cards = try context.fetch(Card.fetchRequest())
            tablView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let card = cards[indexPath.row]
        cell.textLabel?.text = card.title
        cell.imageView?.image = UIImage(data: card.image as! Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let card = cards[indexPath.row]
        performSegue(withIdentifier: "cardSegue", sender: card)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreatorCardVC
        nextVC.card = sender as? Card
    }
}

