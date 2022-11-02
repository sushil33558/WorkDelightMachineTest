//
//  UserImageListViewModel.swift
//  WDTestApp
//
//  Created by sushil Chaudhary on 9/29/22.
//

import Foundation
class UserImageListViewModel:BaseAPI{
    //MARK: - Variables
    //------------------
    var model:ImageList?
    //MARK: - API implemention func()
    //-----------------
    func UserListImageApi(completion:@escaping(Bool,String)->()){
        super.hitApi(requests: Request(url: (URLS.imageBaseUrl, APISuffix.ImageList), method:.get, headers:true)) { (recieved, message, response) in
            print(URLS.imageBaseUrl)
            if response == 1{
                if let data = recieved as? [String:Any]{
                    do{
                        let jsonSer = try JSONSerialization.data(withJSONObject:data, options: .prettyPrinted)
                        self.model = try JSONDecoder().decode(ImageList.self, from:jsonSer)
                        completion(true,message ?? "")
                    }catch{
                        print(error.localizedDescription)
                        completion(false,message ?? "")
                    }
                }else{
                    completion(false,message ?? "")
                }
            }else{
                completion(false,message ?? "")
            }
        }
    }
    
}
