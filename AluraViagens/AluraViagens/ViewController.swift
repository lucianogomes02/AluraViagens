//
//  ViewController.swift
//  AluraViagens
//
//  Created by Luciano Gomes on 08/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viagens: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viagens.dataSource = self
        viagens.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        celula.textLabel?.text = "viagem \(indexPath.row)"
        
        return celula
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cabecalhoView = Bundle.main.loadNibNamed("CabecalhoView", owner: self, options: nil)?.first as? CabecalhoView

        return cabecalhoView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}

