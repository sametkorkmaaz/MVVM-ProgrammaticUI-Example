//
//  HomeViewModel.swift
//  MVVM-ProgrammaticUI-Example
//
//  Created by Samet Korkmaz on 5.09.2024.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeViewInterface? { get set }
    
    func viewDidLoad()
    func fetchItems()
    func changeLoading()
}

final class HomeViewModel {
    weak var view: HomeViewInterface?
    let rickyMortyService: IRickyMortyService
    
    var homeLabelText = "Rick and Morty"
    var rickymortyCharacters: [Result] = []
    private var isLoading = false

    
    init(){
        rickyMortyService = RickyMortyService()
    }

}
extension HomeViewModel: HomeViewModelInterface{
    func viewDidLoad() {
        view?.configurePage()
        fetchItems()
    }
    
    func fetchItems() {
        changeLoading()
        rickyMortyService.fetchAllData { [weak self] (respnse) in
            self?.changeLoading()
            self?.rickymortyCharacters = respnse ?? []
            self?.view?.saveDatas(values: self?.rickymortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        view?.changeLoading(isLoad: isLoading)
    }
}
