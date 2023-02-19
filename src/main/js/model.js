import UtilsFetch from "../../common/js/utilsFetch.js";

export class Model {
    constructor() {
    
    }

    async fetchTeamsByFase(fase){
        await UtilsFetch.postData("../common/php/getSquadreByFaseGara.php", {
            id_fase : fase,
        })
            .then(response => this.teams = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));
    }
}
