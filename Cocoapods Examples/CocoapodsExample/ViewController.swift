//
//  ViewController.swift
//  CocoapodsExample
//
//  Created by Fatih Karahan on 30.04.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        //fetchWithURLSession()
        fetchWithAlamofire()
        
        setConstraintViaSnapKit()

    }
    
    //MARK: - SnapKit
    func setConstraintViaSnapKit(){
        redView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(256.0)
            make.height.equalTo(128.0)
            //make.width.height.equalTo(256.0) -> tek satırda ikisinide tanımlayabiliyoruz
        }
    }
    
    func setConstraintsViaAutoLayout(){
        redView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redView.heightAnchor.constraint(equalToConstant: 128.0),
            redView.widthAnchor.constraint(equalToConstant: 256.0)
        ])
    }
    
    
    // MARK: - Alamofire
    func fetchWithAlamofire(){
        AF.request("https://httpbin.org/get").responseJSON(completionHandler: {response in
            print(response)
        })
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
    

}

