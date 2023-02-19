import { Model } from "./model.js";
import { View } from "./view.js";
class Controller {
    constructor(model, view) {
        this.model = model;
        this.view = view;

        const fasi = {
            "scolastica": 1,
            "regionale": 2,
            "nazionale": 3,
            "internazionale": 4,
        };

        this.fase = fasi.scolastica;
        this.changeFase(this.fase);
    }

    async changeFase(fase){
        await this.model.fetchTeamsByFase(fase);
        this.view.clearDataTable();
        this.view.initDataTable(Object.keys(this.model.teams[0]));
        for (let key in this.model.teams) {
            if (this.model.teams.hasOwnProperty(key)) {

                // TODO
                //per gestire il click delle squadre, visto che usiamo una sola tabella, distinguo tra il caso in 
                //cui nella tabella ci siano delle squadre, e quello in cui ci sono gli atleti, ci sono modi migliori?

                //bisognerebbe anche far si che cliccando sulla gara si possa vedere la classifica, quindi si deve mettere un 
                //click event anche su quella forse
                const team = this.model.teams[key];
                if(team){
                    this.view.addEntry(this.model.teams[key], (entry => console.log(team)));
                }else{
                    this.view.addEntry(this.model.teams[key], (entry => console.log(team)));
                }
                
            }
        }
    }
}

new Controller(new Model, new View); 
