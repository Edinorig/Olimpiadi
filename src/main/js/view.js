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

    initDataTable(columns){
        const thead = this.createElement("thead");
        const trow = this.createElement("tr");
        this.dataTable.appendChild(thead);
        thead.appendChild(trow);
        columns.forEach(column => {
          const newColumn = this.createElement("th");
          newColumn.innerHTML = column;
          trow.appendChild(newColumn);
        })
        const tbody = this.createElement("tbody");
        this.dataTable.appendChild(tbody);
        this.dataTableTbody = tbody;
    }

    addEntry(entry, eventListener){
        const trow = this.createElement("tr", "data-row");
        
        if(eventListener){
            trow.addEventListener("click", eventListener);
        }
        
        for (let key in entry) {
          if (entry.hasOwnProperty(key)) {
            const tdata = this.createElement("td");
            tdata.innerHTML = entry[key];
            trow.appendChild(tdata);
          }
        }
        this.dataTableTbody.appendChild(trow);
      }

}


import Header from "../../common/components/header/header.js";

const wrapper = {
    header: document.querySelector('section#header'),
};

const props = {
    header: {},
};

const header = new Header(wrapper.header, props.header);
header.init();