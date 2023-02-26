import UtilsFetch from "../../common/js/utilsFetch.js";

export class Model {
    constructor() {
        this.getWinners();
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
        return this.fasi;
    }


    async getCalendario() {
        await UtilsFetch.postData("../common/php/dbGetCalendario.php", {
        })
            .then(response => this.teams = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));;
    }

    async getAtletaByNome(nome_atleta) {
        await UtilsFetch.postData("../common/php/getAtletaByNome.php", { nome_atleta: nome_atleta })
            .then(response => this.atletiByNome = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));
        return this.atletiByNome;
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
        console.log(this.risultatiAtleta);
        return this.risultatiAtleta;

    }


    async getClasificaGara(id_gara) {
        await UtilsFetch.postData("../common/php/getClasificaGara.php", { id_gara: id_gara })
            .then(response => this.risultatiClasifica = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));
        return this.risultatiClasifica;
    }

    async getWinners() {
        await UtilsFetch.postData("../common/php/getWinners.php")
            .then(response => this.winners = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));
        return this.winners;

    }
}
