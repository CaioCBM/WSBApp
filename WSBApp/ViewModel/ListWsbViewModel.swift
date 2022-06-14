//
//  ListWsbViewModel.swift
//  WSBApp
//
//  Created by Yhan Nunes on 12/06/22.
//

import Foundation
import Alamofire

class ListWsbViewModel {
    private(set) var items = Wsbapi()
    
    func getJson(url: String, completion: @escaping (Wsbapi)->Void){
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {
                  return
                }
                do {
                    let wsbData = try JSONDecoder().decode(Wsbapi.self, from: data)
                    self.items.append(contentsOf: wsbData)
                    completion(wsbData)
                } catch {
                    print(error)
                }
            }
        }

}
