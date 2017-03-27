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
    @IBOutlet weak var teams: UILabel!
    @IBOutlet weak var imageSport: UIImageView!
    @IBOutlet weak var title: UILabel!
}

class EventListController: UIViewController {
    var events : [Event] = []
    
    @IBOutlet weak var eventListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let event1 = Event(id: 1, nameMatch: "", nameCompetition: "Ligue 1", nameEquip1: "Paris Saint Germain", nameEquip2: "Bordeaux", coteEquip1: 1.75, coteEquip2: 2.35, coteTie: 1.96, date: Date.init(), image: "")
        events.append(event1)
        
        let event2 = Event(id: 2, nameMatch: "", nameCompetition: "Ligue 1", nameEquip1: "Petit Quevilly", nameEquip2: "Bordeaux", coteEquip1: 1.75, coteEquip2: 2.35, coteTie: 1.96, date: Date.init(), image: "")
        events.append(event2)
        
        let event3 = Event(id: 3, nameMatch: "", nameCompetition: "Ligue 1", nameEquip1: "VAFC", nameEquip2: "Petit Quevilly", coteEquip1: 1.75, coteEquip2: 2.35, coteTie: 1.96, date: Date.init(), image: "")
        events.append(event3)
        
        
        self.eventListView.dataSource = self
    }
    
}



extension EventListController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventForRow = self.events[indexPath.row]
        
        self.performSegue(withIdentifier: "eventDetailsSegue", sender: eventForRow)
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
        eventCell.title.text = eventForRow.nameCompetition + " - " + String(describing: eventForRow.date)
        eventCell.teams.text = eventForRow.nameEquip1 + " - " + eventForRow.nameEquip2
        eventCell.imageSport.image = UIImage(named:"foot")
        
        return eventCell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
