//
//  EventListController.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation
import UIKit


class EventListCell : UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageSport: UIImageView!
    @IBOutlet weak var title: UILabel!
}

class EventListController: UIViewController {
    var events : [EventChris] = []
    
    @IBOutlet weak var eventListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let event1 = EventChris(date: Date.init(), host: "PSG", guest: "OL", league:"Football/Ligue 1")
        events.append(event1)
        
        let event2 = EventChris(date: Date.init(), host: "PSG", guest: "OL", league:"Football/Ligue 1")
        events.append(event2)
        
        let event3 = EventChris(date: Date.init(), host: "PSG", guest: "OL", league:"Football/Ligue 1")
        events.append(event3)
    
        
        self.eventListView.dataSource = self
    }
    
}
extension EventListController : UITableViewDataSource{
    // Nombre de sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Nombre de lignes par section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    // Logique de l'affichage de notre cellule
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // On récupère l'objet dans le tableau
        let eventForRow = self.events[indexPath.row]
        
        // On récupère notre modèle de cellule
        guard let eventCell: EventListCell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as? EventListCell else {
            return EventListCell()
        }
        
        // On fixe les valeurs des éléments UI de notre cellule
        eventCell.title.text = eventForRow.league + " - " + String(describing: eventForRow.date)
        eventCell.label.text = eventForRow.host + " - " + eventForRow.guest
        eventCell.imageSport.image = UIImage(named:"foot")
        
        return eventCell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
