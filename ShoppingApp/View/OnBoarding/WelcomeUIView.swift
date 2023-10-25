//
//  WelcomeUIView.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import SwiftUI

struct WelcomeUIView: View {
    
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
                    ForEach(OnboardingModel.list) { viewData in
                        OnboardingUIView(data: viewData)
                            .tag(viewData.id)
                    }
                })
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
    
}

struct WelcomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeUIView()
    }
}
