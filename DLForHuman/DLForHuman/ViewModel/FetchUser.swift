//
//  FetchUser.swift
//  DLForHuman
//
//  Created by admin on 7/6/20.
//  Copyright © 2020 Naimankhan Ayan. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftSoup

class FetchUser : ObservableObject {
    
      @Published var isAuthorized : Bool = false
   @Published var user : User = User(id: "Default", name: "Default")
    @Published var subjects = [Subject]()
    func fetchData(id : String , password: String , complition : @escaping () -> ()) {

            let parameters : [String : String] =
            [
                // POST data
                "anchor":"",
                "logintoken": FetchUser.getToken() ,
                "username":id,
                "password":password
            ]
            AF.request("https://dl.iitu.kz/login/index.php", method: .post , parameters: parameters ).response {
                (response) in
                guard let data = response.data else {return}
                do {
                    let html = String(data: data, encoding: String.Encoding.utf8)
             
                do {
                    
                    let doc = try! SwiftSoup.parse(html!)
                    do{
                        
                        let name = try! doc.select("span[class=usertext mr-1]").first()?.text() ?? ""
                        print(name)
                        if name != "" {
                        self.user = User(id: id, name: name)
                            self.log()
                            
                        }
                        else{
                            self.isAuthorized = false
                        }
                    }
                   
                    
                }
                catch {
                    print("Error in log")
                }
                    
                }
                catch {
                    print("Error in log")
                }
       AF.request("https://dl.iitu.kz/grade/report/overview/index.php" ).response {
            (response) in
       
            guard let data = response.data else {return}
            do {
                let html = try String(data: data, encoding: String.Encoding.utf8)
            do {
                
                let doc = try! SwiftSoup.parse(html!)
                do{
                  let body = try! doc.select("tbody")
                    let subjects = try! body.select("td[class=cell c0]")
                    let finalGrade = try! body.select("td[class=cell c1]")
                    for (num ,sub ) in subjects.enumerated() {
                        self.subjects.append(Subject(name:try sub.text() , link: try sub.select("a").attr("href") , finalGrade:try finalGrade[num].text() ))
                      
              }
                    complition()
                    
                    print(self.subjects)
                   }
            }
            catch {
                print("Error")
            }
            
            catch {
                           print("Error")
                       }
        }
            catch {
                           print("Error")
                       }
        
        }
  
            }.resume()
        
    }
    func log() {
        self.isAuthorized = true
    }
static func getToken() -> String {
         let myURLString = "https://dl.iitu.kz/login/index.php"
        guard let myURL = URL(string: myURLString) else {
            return "error!"
        }
        do {
            let myHTMLString = try! String(contentsOf: myURL , encoding: .utf8)
           
            do {
                let doc = try! SwiftSoup.parse(myHTMLString)
                
                do {
                    let csrf = try! doc.select("input[name=logintoken]").first()!.val()
                  
                    return csrf
                    
                }
            }
        }
        catch {
            print("No internet connection")
        }

    }
}
