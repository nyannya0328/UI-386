//
//  Home.swift
//  UI-386
//
//  Created by nyannyan0328 on 2021/12/07.
//

import SwiftUI

struct Home: View {
    @State var currentTab : Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing:0){
            
            
            TabView(selection: $currentTab) {
                MainPage()
        
                    .tag(Tab.Home)
                
                Text("B")
                    .tag(Tab.Liked)
                
                
                Text("C")
                    .tag(Tab.Cart)
                
                Text("D")
                    .tag(Tab.Profile)
                
            }
            
            HStack(spacing:0){
                
                
                ForEach(Tab.allCases,id:\.self){image in
                    
                    
                    Button {
                        withAnimation{
                            
                            currentTab = image
                        }
                    } label: {
                        Image(image.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(currentTab == image ? Color("Purple") : .gray)
                            .frame(maxWidth:.infinity)
                            .background(
                            
                                Color("Purple").opacity(0.2)
                                .blur(radius: 5)
                                .cornerRadius(10)
                                .padding(-6)
                                .opacity(currentTab == image ? 1 : 0)
                        
                            
                            
                            )
                    }

                    
                }
                
            }
            .padding([.horizontal,.top])
            .padding(.bottom)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

enum Tab : String,CaseIterable{
    
    case Home = "Home"
    case Liked = "Liked"
    case Cart = "Cart"
    case Profile = "Profile"
}
