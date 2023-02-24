//
//  HomeView.swift
//  Bored??
//
//  Created by Prathamesh Araikar on 23/01/22.
//

import SwiftUI

struct HomeView: View {
    
    var backgroundColor: Color = Color.black
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Text("Bored ??")
                        .font(.system(size: 60))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    NavigationLink(destination: FinalView()) {
                        Text("YES !!")
                            .font(.system(size: 40))
                            .frame(width: 200, height: 200)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(40)
                    }
 
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
