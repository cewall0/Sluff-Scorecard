//
//  RulesView.swift
//  Sluff Scorecard
//
//  Created by Chad Wallace on 1/18/25.
//

import Foundation
import SwiftUI
import Observation


struct RulesView: View {
    
    @Environment(Game.self) private var game
    @Binding var path: NavigationPath
    
    func reset() {
        self.path = NavigationPath()
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack{
                    Spacer()
                    Image("SluffScorecardTitleSVG")
                        .resizable()
                        .frame(width: 250, height: 140)
                        .padding(.top, -10)
                        .padding(.bottom, -30)
                    Spacer()
                }
                
                Text(" ")
                Text("Rules of Sluff")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Group {
                    Text("Introduction")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Sluff is traditionally played with a fraction of two Rook decks.")
                }
                
                Divider()
                
                Group {
                    Text("Teams")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Sluff is played with 4, 6, 8, or 10 players in two competing teams, each with an equal number of players. The number of players is selected on the opening screen of the ")
                    + Text("Sluff ")
                        .foregroundStyle(.blue)
                    + Text("Scorecard ")
                        .foregroundColor(Color(red: 212/255, green: 53/255, blue: 214/255))
                    + Text("app. Games with 6-10 players are most common.")
                    
                    Text("Players from each team sit in alternating seats around the table.")
                    Image("seating")
                        .resizable() // Make the image resizable
                        .frame(width: 200, height: 200)
                    
                    Text("In the ")
                    + Text("Sluff ")
                        .foregroundStyle(.blue)
                    + Text("Scorecard ")
                        .foregroundColor(Color(red: 212/255, green: 53/255, blue: 214/255))
                    + Text(", the scorekeeper can change the names for each player and team from Team 1, Team 2, Player 1, Player 2... to make it easier to keep track of the bids.")
                    Image("names")
                        .resizable() // Make the image resizable
                        .frame(width: 250, height: 500)
                    
                }
                
                Divider()
                
                Group {
                    Text("Objective of each hand")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("In Sluff, the main objective is for your team to win the number of tricks your team bid (or more) and have all players who Sluff win zero tricks.")
                }
                
                Divider()
                
                Group {
                    Text("Objective of the game")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("The team with the higher score at the end of the game wins. The game concludes when each player has had the opportunity to deal. Therefore, the number of rounds played equals the number of players.")
                }
                
                Divider()
                
                Group {
                    Text("The Cards")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Sluff is played with two rook decks. A regular rook deck does not have the four traditional suits. Instead, it has four colors (red, black, green, and yellow). Each color contains 1 through 14. Two cards have a bird on them. ")
                    Text("The ranking of the cards from high to low is: 1, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2. In Sluff, the black cards are always trump.")
                    Image("cards")
                        .resizable()
                        .frame(width: 200, height: 150)
                    Text("Sluff is never played with the bird cards. Some other cards may be discarded depending on the number of players in the game.")
                    Text("• 4 players: Discard all 2, 3, 4, 5, 6, 7, and 8 cards. Replace one ")
                    + Text("red 9")
                        .foregroundColor(.red)
                    + Text(" with a ")
                    + Text("red 2")
                        .foregroundColor(.red)
                    + Text(".")
                    Text("• 6 players: Discard all 2, 3, 4, and 5 cards except for the ")
                    + Text("red 2")
                        .foregroundColor(.red)
                    + Text(" and ")
                    + Text("green 2")
                        .foregroundColor(.green)
                    + Text(". Put them back in.")
                    Text("• 8 players: Play with all of the cards.")
                    Text("• 10 players: Remove one ")
                    + Text("red 5")
                        .foregroundColor(.red)
                    + Text(" and one ")
                    + Text("green 5")
                        .foregroundColor(.green)
                    + Text(".")
                    Text("")
                }
                
                Divider()
                
                Group {
                    Text("The Shuffle and Deal")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("When using ")
                    + Text("Sluff ")
                        .foregroundStyle(.blue)
                    + Text("Scorecard ")
                        .foregroundColor(Color(red: 212/255, green: 53/255, blue: 214/255))
                    + Text(", Player 1 should be the first dealer in the game. The yellow D,  (D) next to Player 1 indicates they are the current dealer. The dealer shuffles the cards and deals clockwise, one at a time, to the players. 14 cards are dealt to each player if there are 6 or 8 players. 11 cards are dealt to each player if there are 10 players.  The remaining cards remain face-down and will not be used for this round. Alternatively, the dealer may place all cards in the center of the table spread out and faced down. Players all help mix the pile and then select their own 11 or 14 cards from the mixed-up pile. After each hand, the player to the dealer's left becomes the new dealer.")
                    Image("dealer")
                        .resizable()
                        .frame(width: 300, height: 100)
                }
                
                Divider()
                
                Group {
                    Text("The Bid")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("The player to the dealer's left begins the bidding process. The player makes a bid based on how many tricks they believe they can help their team win, or the player may Sluff which means they bid zero and intend to win zero tricks.  The bids from all players on a team are added together to give the team's total bid. The scorekeeper should record the bid for each player next to their name in the ")
                    + Text("Sluff ")
                        .foregroundStyle(.blue)
                    + Text("Scorecard ")
                        .foregroundColor(Color(red: 212/255, green: 53/255, blue: 214/255))
                    + Text("and ")
                    + Text("Sluff ")
                        .foregroundStyle(.blue)
                    + Text("Scorecard ")
                        .foregroundColor(Color(red: 212/255, green: 53/255, blue: 214/255))
                    + Text("keeps track of the total bid and total sluffs for you.")
                }
                
                Divider()
                Group {
                    Text("Playing the Hand")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("The player with the first ")
                    + Text("red 2")
                        .foregroundColor(.red)
                    + Text(" in their hand plays leads that ")
                    + Text("red 2")
                        .foregroundColor(.red)
                    + Text(" for the first card played in a round. Play continues clockwise with the player to their left playing the next card. If the game is an 8- or 10-player game, there are two red 2 cards. The player going clockwise from the dealer with the first ")
                    + Text("red 2")
                        .foregroundColor(.red)
                    + Text(" is the one who plays their ")
                    + Text("red 2")
                        .foregroundColor(.red)
                    + Text(". Players must lay a card of the same color as the card first led. If they do not have that color in their hand, they can either play a trump card (which are always the black cards) or they can play off-suit. After all players have played a card, the highest-trump card played, if one has been played, or the highest ranking card matching that of the first card of that hand, wins the trick. If there is a tie for the highest card, the player who played the card first wins the trick. One player on the team who won the trick collects the trick and places it in a small stack in front of them to keep track of how many tricks their team wins.")
                    Text("The player who wins the trick with the highest card leads the first card of the next hand.")
                }
                Divider()
                Group {
                    Text("Scoring")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Sluff ")
                        .foregroundStyle(.blue)
                    + Text("Scorecard ")
                        .foregroundColor(Color(red: 212/255, green: 53/255, blue: 214/255))
                    + Text("makes this easy for you. Simply enter the number of tricks and Sluffs won by each team and it will calculate the score for you.")
                    Text("1. If a team does not take as many tricks as they bid, they get zero points for the round.")
                    Text("2. If a team does take as many tricks as they bid, they get 10 points for each point they bid.")
                    Text("3. If a team takes more tricks than they bid, they get 10 points for each one they bid and 1 more point for each additional trick they won.")
                    Text("4. If a player who bid Sluff wins zero tricks, they earn +50 points for their team. If they do not win their Sluff because they took one or more tricks, they lose 50 points for their team. ")
                    Text("• Important Caveat: ").bold()
                    + Text("If a team did not win the number of tricks they bid, they get zero points for that round, period. The Sluffs they won or lost do not count for or against them. They only get zero points for their team for that round. ")
                    Text("5. The game is won by the team with the highest score once all players have dealt one time.")
                    Text("Example:").underline().bold()
                    Text("Bid").underline()
                    Text("Team 1: Bids 5 with two players Sluffing.")
                    Text("Team 2: Bids 6 with 1 player Sluffing.")
                    Text("Result").underline()
                    Text("Team 1: Wins 9 tricks. One player won their Sluff. One player lost their Sluff.")
                    Text("Team 2: Wins 5 tricks. One player won their Sluff.")
                    Text("Score for this round").underline()
                    Text("Team 1: Successfully got their Bid. Ten for each trick bid. (5 X 10) = 50.  One for each over their bid. (4 X 1) = 4, One Sluff won (+50). One Sluff lost (-50). Total = 54")
                    Text("Team 2: Unsuccessful and did not get their Bid. 0 points given. No points, even for their Sluff.")

                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct RulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            RulesView()
//        }
//    }
//}
