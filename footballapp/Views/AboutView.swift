//
//  AboutView.swift
//  footballapp
//
//  Created by Andi Surya on 7/30/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Football App")
                    .font(.title)

                Spacer().frame(height: 16)

                Text("Simple 3 page app using The Sport DB for Dicoding Belajar Membuat Aplikasi iOS Pemula")
                    .multilineTextAlignment(.center)
                    .font(.caption)

                Spacer().frame(height: 8)

                Text("Created by Andi Surya")
                    .font(.caption)

                Spacer().frame(height: 24)

                Button(action: {
                    if let url = URL(string: "https://www.dicoding.com/academies/171/") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Text("Kelas Dicoding")
                        Image(systemName: "arrow.up.forward.app.fill")
                    }
                }
                .buttonStyle(.borderedProminent)

                Spacer().frame(height: 16)

                Button(action: {
                    if let url = URL(string: "https://www.linkedin.com/in/andisoerja/") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Text("LinkedIn Creator")
                        Image(systemName: "arrow.up.forward.app.fill")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .navigationTitle("About App")
    }
}

#Preview {
    AboutView()
}
