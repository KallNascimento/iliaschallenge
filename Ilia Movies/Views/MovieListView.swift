//
//  MovieListView.swift
//  Ilia Movies
//
//  Created by Kauê Nascimento on 29/08/21.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    var body: some View {
        NavigationView{
            List{
            
            Group{
                if nowPlayingState.movies != nil {
                    MoviePosterCarouselView(title: "Now Playing", movies:   nowPlayingState.movies!)
                }else {
                    LoadingView(isLoading: nowPlayingState.isLoading, error: nowPlayingState.error){
                        self.nowPlayingState.loadMovies(with: .nowPlaying)
                    }
                }
            }
            .listRowInsets(EdgeInsets(top:16, leading: 0,bottom: 16,trailing: 0))
                Group{
                    if upcomingState.movies != nil {
                        MoviePosterCarouselView(title: "Upcoming", movies:   upcomingState.movies!)
                    }else {
                        LoadingView(isLoading: upcomingState.isLoading, error: upcomingState.error){
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                
                .listRowInsets(EdgeInsets(top:8, leading: 0,bottom: 8,trailing: 0))
                
                Group{
                    if topRatedState.movies != nil {
                        MoviePosterCarouselView(title: "Top Rated", movies:   topRatedState.movies!)
                    }else {
                        LoadingView(isLoading: topRatedState.isLoading, error: topRatedState.error){
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top:8, leading: 0,bottom: 8,trailing: 0))
                Group{
                    if popularState.movies != nil {
                        MoviePosterCarouselView(title: "Popular", movies:   popularState.movies!)
                    }else {
                        LoadingView(isLoading: popularState.isLoading, error: popularState.error){
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                    
                }
                .listRowInsets(EdgeInsets(top:8, leading: 0,bottom: 8,trailing: 0))
            }
            .navigationTitle("Ilia Movies")
            
            
        }
        .onAppear{
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.popularState.loadMovies(with: .popular)
            self.topRatedState.loadMovies(with: .topRated)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
