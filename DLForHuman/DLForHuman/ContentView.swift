//
//  ContentView.swift
//  DLForHuman
//
//  Created by admin on 6/13/20.
//  Copyright © 2020 Naimankhan Ayan. All rights reserved.
//

import SwiftUI
import Alamofire
import ActivityIndicatorView
import SwiftSoup


struct ContentView: View {
    @State var signInSuccess = false
    @State var showLoad = false
    @State var share = FetchUser()
    var body: some View {
        return Group {
             if signInSuccess {
                        Home(share: $share)
                    }
                    else {
                        LoginView( showLoad : $showLoad, signInSuccess: $signInSuccess, share: $share )

                    }
                }
  
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

