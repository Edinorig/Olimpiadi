import { Model } from "./model.js";
import { View } from "./view.js";
class Controller {
    constructor(model, view) {
        this.model = model;
        this.view = view;
        this.initSelectFields();
    }

    async initSelectFields(){
        await this.model.initProblemCategories(); //fai la query per le categorie di problemi
        this.view.fillProblemCategories(this.model.problemCategories); //inseriscile nella view
    }
}

new Controller(new Model, new View); 
