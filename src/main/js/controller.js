import { Model } from "./model.js";
import { View } from "./view.js";
class Controller {
    constructor(model, view) {
        this.model = model;
        this.view = view;
        this.init();
    }

    async init() {
        const fasi = await this.model.getFasi();
        fasi.forEach(fase => {
            this.view.addFaseButton(fase, () => this.changeFase(fase))
        });

        this.fase = fasi[0]; //inizia con la fase scolastica
        this.changeFase(this.fase);
    }

    async changeFase(fase) {
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
        console.log(team);
        const atleti = await this.model.getAtletiBySquadra(team.id_squadra);
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(atleti[0]));
        for (let key in atleti) {
            if (atleti.hasOwnProperty(key)) {

                //TODO  
                //bisognerebbe anche far si che cliccando sulla gara si possa vedere la classifica, quindi si deve mettere un 
                //click event anche su quella forse
                const atleta = atleti[key];
                this.view.addEntry(atleta, (() => console.log(atleta)));
            }
        }
    }
}

new Controller(new Model, new View); 
