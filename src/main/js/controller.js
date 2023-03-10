import { Model } from "./model.js";
import { View } from "./view.js";
class Controller {
    constructor(model, view) {
        this.model = model;
        this.view = view;
        this.model.getIstituti();
        this.init();
    }

    async init() {
        let buttonCalendario = document.querySelector('.calendario');
        const searchInput = document.getElementById("search");
        const searchBtn = document.getElementById("search-btn");
        const fasi = await this.model.getFasi();
        fasi.forEach(fase => {
            this.view.addFaseButton(fase, () => this.changeFase(fase))
        });

        buttonCalendario.addEventListener('click', (e) => {
            this.getCalendario();
            //this.getclasificaGara();
        });

        searchBtn.addEventListener("click", () => {
            const nome = searchInput.value;

            console.log(nome);

            this.showAtletiByNome(nome);
        });

        this.view.winnerButton.addEventListener("click", () => this.showWinners());

        this.view.schoolsButton.addEventListener("click", () => this.showIstituti());

        this.fase = fasi[0]; //inizia con la fase scolastica
        this.changeFase(this.fase);
    }

    async changeFase(fase) {
        this.view.modifyCategoryTitle("Squadre fase: " + fase.nome);
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


    async showWinners() {
        this.view.modifyCategoryTitle("Vincitori");
        const winners = await this.model.getWinners();
        console.log(winners);
        this.view.updateWinners(winners);
    }

    async showIstituti() {
        this.view.modifyCategoryTitle("Istituti scolastici:");
        const atleti = await this.model.getIstituti();
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(atleti[0]));
        for (let key in atleti) {
            if (atleti.hasOwnProperty(key)) {
                const atleta = atleti[key];
                this.view.addEntry(atleta);
            }
        }
    }

    async showAtleti(team) {
        this.view.modifyCategoryTitle("Atleti della squadra: " + team.squadra);
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

    async showAtletiByNome(nome) {
        this.view.modifyCategoryTitle("Atleti di nome: " + nome);
        const atleti = await this.model.getAtletaByNome(nome);
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
        this.view.modifyCategoryTitle("Gare in cui ha partecipato " + atleta.nome + " " + atleta.cognome);
        const risultati = await this.model.getRisultatiAtleta(atleta.id);
        this.view.clearDataTable();

        this.view.initDataTable(Object.keys(risultati[0]));
        for (let key in risultati) {
            if (risultati.hasOwnProperty(key)) {
                const risultato = risultati[key];
                this.view.addEntry(risultato, (() => this.getclasificaGara(risultato)));
            }
        }
    }

    async getCalendario() {
        this.view.modifyCategoryTitle("Calendario gare");
        await this.model.getCalendario();
        this.view.clearDataTable();
        console.log(this.model.teams);
        this.view.initDataTable(Object.keys(this.model.teams[0]));
        for (let key in this.model.teams) {
            if (this.model.teams.hasOwnProperty(key)) {
                const team = this.model.teams[key];
                this.view.addEntry(team, (() => this.getclasificaGara(team)));
            }
        }
    }

    async getclasificaGara(team) {
        this.view.modifyCategoryTitle("Classifica della gara: " + team.luogo_gara + " (" + team.fase_gara + ")");
        await this.model.getClasificaGara(team.id);
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(this.model.risultatiClasifica[0]));
        for (let key in this.model.risultatiClasifica) {
            if (this.model.risultatiClasifica.hasOwnProperty(key)) {
                const team = this.model.risultatiClasifica[key];
                this.view.addEntry(team, (() => this.showRisultatiAtleta(team)));
            }
        }
    }

    async getAtletaByNome(nome) {
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
