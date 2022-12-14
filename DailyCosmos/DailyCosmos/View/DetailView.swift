//
//  DetailView.swift
//  FetchDataSample
//
//  Created by 박제균 on 2022/11/24.
//

import SwiftUI

struct DetailView: View {

    @Environment(\.dismiss) var dismiss
    @State private var translatedString: String = ""
    let spaceData: SpaceData

    var body: some View {
        
        NavigationStack {

            ScrollView {

                AsyncImage(url: URL(string: spaceData.URL)!) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }

                VStack {
                    
                    HStack {

                        Button {
                            Task {
                                let result = try await NetworkManager.shared.requestTranslate(spaceData.explanation)
                                let decodedResult: TranslateResponse = NetworkManager.shared.decodeData(result)
                                translatedString =
                                decodedResult.message.result.translatedText
                            }
                        } label: {
                            Text("번역하기")
                            Image(systemName: "globe")
                        }
                            .padding()


                        Spacer()
                    }

                    Text(spaceData.explanation)
                        .font(.body)
                        .padding()

                    Text(translatedString)
                        .font(.body)
                        .padding()
                }

            }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(spaceData.title)
                        .font(.headline)
                        .padding()
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .renderingMode(.original)
                            .foregroundColor(.red)
                    }
                }


            }
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(spaceData: SpaceData(date: "", explanation: "", mediaType: "", title: "title", URL: "www.naver.com"))
    }
}
