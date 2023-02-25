export class View {
    constructor() {
        this.dataTable = document.querySelector(".data-table");
        this.fasiButtons = document.querySelector(".fasi-buttons");
        this.categoryTitle = document.querySelector(".category-title");
        this.winnerButton = document.querySelector("#winner-button");
    }

    createElement(tag, className) {
        const element = document.createElement(tag);
        if (className) element.classList.add(className); //se hai passato una classe css la aggiunge, sennò non lo fa
        return element
    }

    addFaseButton(faseData, eventListener) {
        const button = this.createElement("button");
        button.name = "fase";
        button.value = faseData.id;
        button.classList.add("fasi");
        button.innerHTML = `<p>${faseData.nome}</p>`;
        button.addEventListener("click", eventListener);
        this.fasiButtons.appendChild(button);
    }

    clearDataTable() {
        while (this.dataTable.firstChild) {
            this.dataTable.removeChild(this.dataTable.lastChild);
        }
    }

    initDataTable(columns) {
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

    addEntry(entry, eventListener) {
        const trow = this.createElement("tr", "data-row");

        if (eventListener) {
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

    modifyCategoryTitle(title) {
        this.categoryTitle.innerHTML = title;
    }

}


import Header from "../../common/components/header/header.js";
import NavButtons from "../../common/components/navButtons/navButtons.js";
import SearchWrapper from "../../common/components/searchWrapper/searchWrapper.js";

const wrapper = {
    header: document.querySelector('section#header'),
    navButtons: document.querySelector('.wrapper-calendar')
};

const props = {
    header: {},
};

const header = new Header(wrapper.header, props.header);
header.init();


const buttonName = "Calendario"
const navButtons = new NavButtons(wrapper.navButtons, buttonName);
navButtons.init();

const serach = new SearchWrapper(wrapper.navButtons)
serach.init();
