import UtilsFetch from "../../common/js/utilsFetch.js";

export class Model {
    constructor() {
        UtilsFetch.postData("../common/php/getSquadreByFaseGara.php", {
            id_fase : 1,
        })
            .then(response => console.log(JSON.parse(response.data)))
            .catch(exeption => console.log(exeption));
    }
}
