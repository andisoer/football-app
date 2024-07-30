//
//  FootbalTeamService.swift
//  footballteamapp
//
//  Created by Andi Surya on 7/25/24.
//

import SwiftUI

struct FootbalTeamListView: View {
    @ObservedObject var viewModel = FootballTeamViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error :\(errorMessage)")
                } else {
                    List(viewModel.footballTeams) { team in
                        FootballTeamRowView(team: team)
                    }.listStyle(PlainListStyle())
                }
            }
            .onAppear {
                viewModel.fetchFootballTeams()
            }
            .navigationTitle("Football Teams")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        NavigationLink(destination: AboutView()) {
                            Image(systemName: "info.circle")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FootbalTeamListView()
}
