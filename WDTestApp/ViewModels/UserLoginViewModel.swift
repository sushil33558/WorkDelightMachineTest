//
//  UserLoginViewModel.swift
//  WDTestApp
//
//  Created by sushil Chaudhary on 9/29/22.
//

import Foundation
import Alamofire
class UserLoginViewModel:BaseAPI{
    //MARK: -variables
    //----------------
    var model:UserLogin?
    //MARK: - API hit Func()
    //----------------------
    func userLoginAPI(email:String,password:String,completion:@escaping(Bool,String)->()){
    let param = ["email":email,"password":password,"one_signal_id":"","app_version":"","device_type":""] as baseParameters
        super.hitApi(requests:Request(url: (URLS.baseUrl, APISuffix.userLogin), method: .post, parameters: param, headers:false)) { (recieved, message, response) in
            if response == 1{
                if let data = recieved as? [String:Any]{
                    do{
                        let jsonSer = try JSONSerialization.data(withJSONObject:data, options: .prettyPrinted)
                        self.model = try JSONDecoder().decode(UserLogin.self, from: jsonSer)
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
