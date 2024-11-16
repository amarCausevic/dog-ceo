import SwiftUI

struct MainView: View {
    @StateObject private var mainViewListModel = MainViewViewModel()
    @State var searchQuery = ""
    @State private var isLinkActive = false
    
    var body: some View {
        VStack {
            if mainViewListModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else if let errorMessage = mainViewListModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                VStack{
                    NavigationStack {
                        List(filteredDogBreeds.sorted { $0.breed < $1.breed }) { dog in
                            NavigationLink(value: dog) {
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text(Image(systemName: "dog.circle"))
                                        Text(dog.breed)
                                            .font(.headline)
                                            .textCase(.uppercase)
                                    }
                                    if !dog.subtypes!.isEmpty {
                                        Text("Subtypes: \(dog.subtypes!.joined(separator: ", "))")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    } else {
                                        Text("Breed does not have any sub-types")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .padding()
                        }
                        .navigationTitle("Dog Breeds")
                        .navigationDestination(for: DogTypeListModel.self) { dog in
                            BreedDetailsView(dog: dog)
                                .onAppear {
                                    listItemClickEvent(dog)
                                }
                        }
                    }.searchable(text: $searchQuery)
                }
                
            }
        }
        .onAppear {
            mainViewListModel.getDogList()
        }
    }
    
    var filteredDogBreeds: [DogTypeListModel] {
        if searchQuery.isEmpty {
            return mainViewListModel.dogBreeds
        } else {
            return mainViewListModel.dogBreeds.filter {
                $0.breed.lowercased().contains(searchQuery.lowercased())
            }
        }
    }
}

func listItemClickEvent(_ dog: DogTypeListModel) {
    print("Dog clicked: \(dog.breed)")
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
