import { Model } from "./model.js";
import { View } from "./view.js";
class Controller {
    constructor(model, view) {
        this.model = model;
        this.view = view;
        this.init();
    }

    async init() {
        let buttonCalendario = document.querySelector('.calendario');
        const searchInput = document.getElementById("search");
        const searchBtn = document.getElementById("search-btn");

        console.log(buttonCalendario);
        const fasi = await this.model.getFasi();
        fasi.forEach(fase => {
            this.view.addFaseButton(fase, () => this.changeFase(fase))
        });

        buttonCalendario.addEventListener('click', () => {
            this.getCalendario();
        });

        searchBtn.addEventListener("click",  ()=> {
            const nome = searchInput.value;

            console.log(nome);

            debugger

            this.getAtletaByNome(nome);
        });

        this.fase = fasi[0]; //inizia con la fase scolastica
        this.changeFase(this.fase);
    }

    async changeFase(fase) {
        this.view.modifyCategoryTitle("Squadre");
        await this.model.fetchTeamsByFase(fase.id);
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(this.model.teams[0]));
        for (let key in this.model.teams) {
            if (this.model.teams.hasOwnProperty(key)) {

                //TODO  
                //bisognerebbe anche far si che cliccando sulla gara si possa vedere la classifica, quindi si deve mettere un 
                //click event anche su quella forse
                const team = this.model.teams[key];
                this.view.addEntry(team, (() => this.showAtleti(team)));
            }
        }
    }

    async showAtleti(team) {
        this.view.modifyCategoryTitle("Atleti");
        const atleti = await this.model.getAtletiBySquadra(team.id_squadra);
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(atleti[0]));
        for (let key in atleti) {
            if (atleti.hasOwnProperty(key)) {
                const atleta = atleti[key];
                this.view.addEntry(atleta, (() => this.showRisultatiAtleta(atleta)));
            }
        }
    }

    async showRisultatiAtleta(atleta) {
        this.view.modifyCategoryTitle("Atleta: " + atleta.nome + " " + atleta.cognome);
        const risultati = await this.model.getRisultatiAtleta(atleta.id);
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(risultati[0]));
        for (let key in risultati) {
            if (risultati.hasOwnProperty(key)) {
                const risultato = risultati[key];
                this.view.addEntry(risultato, (() => console.log(risultato)));
            }
        }
    }

    async getCalendario() {
        await this.model.getCalendario();
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(this.model.teams[0]));
        for (let key in this.model.teams) {
            if (this.model.teams.hasOwnProperty(key)) {
                const team = this.model.teams[key];
                this.view.addEntry(team, (() => console.log(team)));
            }
        }
    }

    async getAtletaByNome(nome) {
        console.log(nome);
        await this.model.getGaraPunteggio(nome);
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(this.model.teams[0]));
        for (let key in this.model.teams) {
            if (this.model.teams.hasOwnProperty(key)) {
                const team = this.model.teams[key];
                this.view.addEntry(team, (() => console.log(team)));
            }
        }
    }
}

new Controller(new Model, new View); 
