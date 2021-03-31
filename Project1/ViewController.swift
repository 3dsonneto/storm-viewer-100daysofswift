//
//  ViewController.swift
//  Project1
//
//  Created by Edson Neto on 30/03/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default //fm pega o valor retornado por FileManager.default, que permite trabalhar com arquivos
        let path = Bundle.main.resourcePath! //Me conte onde eu acho as imagens, o bundle é um diretorio que contem o programa compilado e os assets.
        let items = try! fm.contentsOfDirectory(atPath: path)//collection dos arquivos achados no source directory especificado em path, vai ser um array de strings com os nomes dos arquivos
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    

}

