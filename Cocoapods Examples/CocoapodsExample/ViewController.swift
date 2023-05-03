//
//  ViewController.swift
//  CocoapodsExample
//
//  Created by Fatih Karahan on 30.04.2023.
//

import UIKit
import Alamofire
import Kingfisher
import FLEX

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        fetchWithURLSession()
        fetchWithAlamofire()
        setConstraintViaSnapKit()
        setImageViaKingfisher()
        setupFlexGesture()
        
    }
    
    
    //MARK: - FLEX
    @objc func didFlexGestureRecognized(_ sender: UITapGestureRecognizer){
        FLEXManager.shared.showExplorer()
    }
    
    func setupFlexGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didFlexGestureRecognized(_:)))
        gesture.numberOfTapsRequired = 2
        gesture.numberOfTouchesRequired = 2
        view.addGestureRecognizer(gesture)
    }

    
    //MARK: - Kingfisher
    func setImageViaKingfisher(){
        imageView.kf.setImage(with: URL(string:"https://uludag.edu.tr/logolar2018/logo_jpeg/2_muhendislik_sb.jpg"))
    }
    
    func setImageViaAlamofire(){
        let cache = NSCache<AnyObject, AnyObject>()
        let url = URL(string:"https://uludag.edu.tr/logolar2018/logo_jpeg/2_muhendislik_sb.jpg")
        if let imageFromCache = cache.object(forKey: url as AnyObject) as? UIImage{
            imageView.image = imageFromCache
            return
        }
        AF.request(url!, method: .get).response{ response in
            switch response.result{
            case .failure(let error):
                print(error)
            case .success(let data):
                guard let data = data,
                        let image = UIImage(data: data) else{
                    return
                }
                cache.setObject(image, forKey: url as AnyObject)
                self.imageView.image = image
            }
        }
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

