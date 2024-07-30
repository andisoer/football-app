//
//  FootballTeamDetailView.swift
//  footballapp
//
//  Created by Andi Surya on 7/29/24.
//

import SwiftUI

struct FootballTeamDetailView: View {
    let team: FootbalTeam

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                HStack {
                    AsyncImage(url: URL(string: team.strBadge!)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView().frame(width: 100, height: 100)
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding(.trailing, 8)
                    .frame(alignment: .leading)

                    VStack(alignment: .leading, spacing: 4) {
                        if team.intFormedYear != nil {
                            Text("Formed \(team.intFormedYear!)")
                                .font(.title2)
                        }

                        if team.strLeague != nil {
                            Text(team.strLeague!)
                                .font(.title2)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(alignment: .leading)

                Spacer().frame(height: 16)

                if team.strDescriptionEN != nil {
                    Text("Overview").font(.headline).frame(maxWidth: .infinity, alignment: .leading)

                    Spacer().frame(height: 8)

                    Text(team.strDescriptionEN!).frame(maxWidth: .infinity, alignment: .leading)
                        .font(.caption)
                        .lineLimit(10)
                }

                Spacer().frame(height: 16)

                if team.strLocation != nil || team.strCountry != nil || team.strStadium != nil {
                    Text("Homebase").font(.headline).frame(maxWidth: .infinity, alignment: .leading)

                    Spacer().frame(height: 8)

                    Text(team.strStadium!)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(team.strLocation!)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(team.strCountry!)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.horizontal, 16)
            .navigationTitle("\(team.strTeam!)")
        }
    }
}

#Preview {
    FootballTeamDetailView(team: FootbalTeam(idTeam: "0", strTeam: nil, intFormedYear: nil, strLeague: nil, strStadium: nil, strDescriptionEN: nil, strBadge: nil, strCountry: nil, strLocation: nil))
}
