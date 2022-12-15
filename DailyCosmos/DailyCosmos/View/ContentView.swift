//
//  ContentView.swift
//  FetchDataSample
//
//  Created by 박제균 on 2022/11/24.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var observer: SpaceDataStore = SpaceDataStore()
    @State var isPresented = false
//    @State private var selectedDate = Date()
    @State private var dateSelected: Date = Date.now
    
    var body: some View {

        VStack {
            
            // TODO: - selection 받기
            MyCalendarView(observer: observer, isPresented: $isPresented, dateSelected: $dateSelected)
//            DatePicker("", selection: $selectedDate)
//
//                .padding()
//                .datePickerStyle(.graphical)
//                .onChange(of: selectedDate) { newValue in
//
//                if newValue > selectedDate {
//
//                } else {
//
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "yyyy-MM-dd"
//                    dateFormatter.locale = Locale(identifier: "en_US")
//                    let dateString = dateFormatter.string(from: selectedDate)
//
//                    Task {
//                        observer.data = try await NetworkManager.shared.fetchDataWithURLString(urlString: NetworkManager.shared.defaultRequestURL + dateString)
//                        isPresented = true
//                    }
//                }
//
//            }

                .sheet(isPresented: $isPresented) {
                if let data = observer.data {
                    DetailView(spaceData: data)
                }
            }



        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
