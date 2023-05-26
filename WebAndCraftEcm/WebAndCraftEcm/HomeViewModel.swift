//
//  HomeViewModel.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//

import Foundation
import Alamofire

class HomeViewModel {
    var categories: [Value] = []
    var banners: [Value] = []
    var products: [Value] = []
    
    func fetchData(completion: @escaping (Bool) -> Void) {
        let url = "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
        
        AF.request(url).responseJSON { response in
            guard let data = response.data else {
                
                completion(false)
                return
            }
            print(data)
            
            do {
                let decodedResponse = try JSONDecoder().decode(HomeResponse.self, from: data)
                self.categories = decodedResponse.homeData?.first(where: { $0.type == "category" })?.values ?? []
                self.banners = decodedResponse.homeData?.first(where: { $0.type == "banners" })?.values ?? []
                self.products = decodedResponse.homeData?.first(where: { $0.type == "products" })?.values ?? []
                
                completion(true)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(false)
            }
        }
    }
}

