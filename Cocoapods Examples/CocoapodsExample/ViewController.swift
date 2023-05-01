//
//  ViewController.swift
//  CocoapodsExample
//
//  Created by Fatih Karahan on 30.04.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
        //fetchWithURLSession()
        fetchWithAlamofire()
    }
    
    func fetchWithURLSession(){
        let url = URL(string: "https://stackoverflow.com")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data else{
                return
            }
            print(String(data: data, encoding: .utf8) ?? "Data not found or not in corret format.")
        }
        task.resume()
    }
    
    
    func fetchWithAlamofire(){
        AF.request("https://httpbin.org/get").responseJSON(completionHandler: {response in
            print(response)
        })
    }
}

