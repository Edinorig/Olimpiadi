import UtilsFetch from "../../common/js/utilsFetch.js";

export class Model {
    constructor() {

    }

    async fetchTeamsByFase(fase) {
        await UtilsFetch.postData("../common/php/getSquadreByFaseGara.php", {
            id_fase: fase,
        })
            .then(response => this.teams = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));
    }

    async getFasi() {
        if (this.fasi == undefined) {
            await UtilsFetch.postData("../common/php/getFasiGara.php")
                .then(response => this.fasi = JSON.parse(response.data))
                .catch(exeption => console.log(exeption));
        }
        console.log(this.fasi);
        return this.fasi;
    }

    async getAtletiBySquadra(team_id) {
        await UtilsFetch.postData("../common/php/getAtletaBySquadra.php", { id_squadra: team_id })
            .then(response => this.atleti = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));
        console.log(this.atleti);
        return this.atleti;
    }

    async getRisultatiAtleta(id_atleta) {
        await UtilsFetch.postData("../common/php/getRisultatiAtleta.php", { id_atleta: id_atleta })
            .then(response => this.risultatiAtleta = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));
        return this.risultatiAtleta;
    }
}
