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
}
