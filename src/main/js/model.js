import UtilsFetch from "../../common/js/utilsFetch.js";

export class Model {
    constructor() {
           
    }

    async initProblemCategories(){
        await UtilsFetch.postData("../common/php/getProblemCategories.php")
            .then(response => this.problemCategories = JSON.parse(response.data))
            .catch(exeption => console.log(exeption));
    }

}
//# sourceMappingURL=model.js.map