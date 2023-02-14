export class View {
    constructor() {
        this.dataTable = document.querySelector(".data-table");
       
    }

    createElement(tag, className) {
        const element = document.createElement(tag);
        if (className) element.classList.add(className); //se hai passato una classe css la aggiunge, sennò non lo fa
        return element
    }

    clearDataTable(){
        while(this.dataTable.firstChild){
            this.dataTable.removeChild(this.dataTable.lastChild);
          }
    }

    
}