//
//  IncidentTypesTableViewController.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import UIKit


extension IncidentTypesTableViewController {
    static func instnatiateWithNavController() -> UIViewController {
        let nav = UINavigationController(rootViewController: IncidentTypesTableViewController())
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }
}
class IncidentTypesTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        self.makeDismissButton()
    }

    func makeDismissButton() {
        let button = UIBarButtonItem(image: SFSymbol.xmark.image, style: .plain, target: self, action: #selector(self.tappedDismiss))
        self.navigationItem.setRightBarButton(button, animated: false)
    }
    
    @objc
    func tappedDismiss() {
        self.dismiss(animated: true, completion: nil)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return IncidentType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let type = IncidentType.allCases[indexPath.row]
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        cell.textLabel?.text = type.rawValue
        cell.detailTextLabel?.text = type.description
        cell.detailTextLabel?.numberOfLines = 4
        cell.detailTextLabel?.lineBreakMode = .byWordWrapping
        cell.imageView?.image = SFSymbol.circleFill.image
        cell.imageView?.tintColor = type.color
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }


}
