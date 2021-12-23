//
//  bookManager.swift
//  E-book
//
//  Created by Daniyal Hussain on 29/11/2021.
//

import Foundation
import Alamofire
import Kingfisher


class bookManager {
        static let shared = bookManager()
    //    var https://api.fda.gov/drug/event.json?search=receivedate:[20040101+TO+20081231]&limit=10
        fileprivate var baseUrl = "https://www.googleapis.com/books/v1/volumes?q=search+term"
   
        
    func  getAllBooksImageForm (limit: Int,completion:@escaping([String] , [String] ,[String])->Void){

        var arr = [String]()
        var books = [books]()
        var title = [String]()
        var publisher = [String]()
         //   let params = ["api_key": "ZqcLdmkS6ye8xtZo8lxk7I6fJob6FCmpk6erzmDf", "search":"receivedate:[20040101+TO+20081231]","limit": "\(limit)"]
            
            AF.request(self.baseUrl).responseJSON { response in
                print("Response = \(response.value)")
              //  let value = response.value as? [String:Any]
             //   let jsonData = value.data(using: .utf8)!
                
                
             //   let blogPos = try! JSONDecoder().decode(books.self, from: response.data!)
            //    print(blogPos.items)
             //   arr.append(blogPos)
           //            let value = response.value as? [String:Any]
                let value = response.value as? [String:Any]
                let items = value?["items"] as? [[String:Any]]
                let id = value?["id"] as? [[String:Any]]
                let etag = value?["etag"] as? [[String:Any]]
                let selfLink = value?["selfLink"] as? [[String:Any]]
//                arr = items ?? []


                for item in items ?? []{
                    if let volumeInfo = item["volumeInfo"] as? [String:Any] {
                      //  if let volumeInfo = item["volumeInfo"] as? [String:Any] {
                         
                          

                      //  }
                       if let imageInfo = volumeInfo["imageLinks"] as? [String:Any]{
                           let smallThumbnail = imageInfo["smallThumbnail"] as? String
                           
                           if let title1 = volumeInfo["title"] as? String{
                               let publisher1 = volumeInfo["publisher"] as? String
                               title.append(title1)
                               publisher.append(publisher1 ?? "")
                               arr.append(smallThumbnail ?? "")
                           //    completion(arr,[],[])
                               completion(arr,title,publisher)
                            }
                          
                        }
                 
                    }


            }
    //        AF.request(self.baseUrl+"?search=receivedate:[20040101+TO+20081231]&limit=10", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { DataResponse in
    //            guard let data = DataResponse.data else {return}
    //            do {
    //                let medicine = try JSONDecoder().decode([Medicine].self, from: data)
    //
    //                print("medicine == \(Medicine.self)")
    //
    //            } catch {
    //                print("error decoding == \(error)")
    //            }
    //
    //        }
            
        }
    //      func  getAllCountryNameForm(completion:@escaping([String])->Void){
    //
    //        var arr = [String]()
    //
    //        let params = ["api_key": "ZqcLdmkS6ye8xtZo8lxk7I6fJob6FCmpk6erzmDf", "search":"receivedate:[20040101+TO+20081231]","limit": "100"]
    //        AF.request(self.baseUrl+"?search=receivedate:[20040101+TO+20081231]&limit=10").responseJSON { response in
    //            print("Response = \(response.value)")
    //            let value = response.value as? [String:Any]
    //            let meta = value?["meta"] as? [String:Any]
    //            let result = value?["results"] as? [[String:Any]]
    //            for item in result ?? []{
    //
    //                if let primarysource = item["primarysource"] as? [String:Any] {
    //                    if let reportercountry = primarysource["reportercountry"] as? String{
    //                        print(reportercountry)
    //                        arr.append(reportercountry)
    //                        completion(arr)
    //
    //                    }
    //
    //
    //
    //
    //                }
    ////                print("DrugValue = \(drug ?? [])")
    //            }
    //
    //
    //        }
    //
    //}
    }
      
//    func  getAllBooksNameForm (limit: Int,completion:@escaping([String], [String])->Void){
//
//        var title = [String]()
//        var publisher = [String]()
//    
//
//    AF.request(self.baseUrl).responseJSON { response in
//        print("Response = \(response.value)")
//        let value = response.value as? [String:Any]
//        let items = value?["items"] as? [[String:Any]]
//        let id = value?["id"] as? [[String:Any]]
//        let etag = value?["etag"] as? [[String:Any]]
//        let selfLink = value?["selfLink"] as? [[String:Any]]
////                arr = items ?? []
//
//
//        for item in items ?? []{
//            if let volumeInfo = item["volumeInfo"] as? [String:Any] {
//             
//               if let title1 = volumeInfo["title"] as? String{
//                   let publisher1 = volumeInfo["publisher"] as? String
//                   title.append(title1)
//                   publisher.append(publisher1 ?? "")
//                   completion(title, publisher)
//                }
//              
//                
//          
//        
//                
//            }
//
//    
//        
//
//    }
//}
//}
}
