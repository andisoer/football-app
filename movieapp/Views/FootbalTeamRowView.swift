//
//  FootbalTeamService.swift
//  footballteamapp
//
//  Created by Andi Surya on 7/25/24.
//

import SwiftUI

struct FootbalTeamRowView: View {
    let team: FootbalTeam

    var body: some View {
        HStack {
            if team.strBadge != nil {
                AsyncImage(url: URL(string: team.strBadge!)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView().frame(width: 70, height: 70)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .cornerRadius(8)
                    case .failure: Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .cornerRadius(8)
                    @unknown default:
                        EmptyView()
                    }
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                if team.strTeam != nil {
                    Text(team.strTeam!)
                        .font(.headline)
                }

                if team.strLocation != nil {
                    Text(team.strLocation!)
                        .font(.caption)
                }
            }
            .padding(.leading, 8)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        FootbalTeamRowView(team: FootbalTeam(idTeam: "0", strTeam: nil, intFormedYear: nil, strLeague: nil, strStadium: nil, strDescriptionEn: nil, strBadge: nil, strCountry: nil, strLocation: nil))
    }
}