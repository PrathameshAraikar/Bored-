//
//  FinalView.swift
//  Bored??
//
//  Created by Prathamesh Araikar on 26/01/22.
//

import SwiftUI

struct DataModel: Codable {
    let activity: String
    let type: String
}

class DownloadData: ObservableObject {
    
    @Published var dataArray: [DataModel] = []
    
    func getData(participant: Int) {
        guard let url = URL(string: "https://www.boredapi.com/api/activity?participants=\(participant)") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Error downloading data")
                    return
                }
            
            guard let newData = try? JSONDecoder().decode(DataModel.self, from: data) else {return}
            
            DispatchQueue.main.async { [ weak self] in
                self?.dataArray.append(newData)
            }
                
        }.resume()
    }
}

struct FinalView: View {
    
    @StateObject var vm = DownloadData()
    
    
    let backgroundColor = LinearGradient(colors: [.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State var stepperValue: Int = 1
    
    var body: some View {
        let data = vm.dataArray.last
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TitleView(title: "Activity")
                
                BodyView(title: data?.activity ?? "Your Activity")
                
                TitleView(title: "Type")
                
                BodyView(title: data?.type ?? "of Type")
                
//                TitleView(title: "Participants")
                
                Stepper("Participants:     \(stepperValue)",
                        value: $stepperValue, in: 1...5)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.bottom)
                    .padding(.top)
                
                Button {
                    vm.getData(participant: stepperValue)
                } label: {
                    Text("GO!!")
                        .font(.system(.title))
                        .fontWeight(.semibold)
                        .frame(width: 150, height: 50)
                        .background(backgroundColor)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding()
                }
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .top)
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}

struct TitleView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.system(size: 40))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct BodyView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding()
    }
}
