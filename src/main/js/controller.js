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
              this.view.addEntry(this.model.teams[key]);
            }
          }
    }
}

new Controller(new Model, new View); 
