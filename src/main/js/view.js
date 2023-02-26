export class View {
    constructor() {
        this.dataTable = document.querySelector(".data-table");
        this.fasiButtons = document.querySelector(".fasi-buttons");
        this.categoryTitle = document.querySelector(".category-title");
        this.winnerButton = document.querySelector("#winner-button");

        this.winners = document.querySelector(".winners");
        this.winners.style.display = "none";
    }


    updateWinners(winners) {
        this.winners.style.display = "block";
        this.dataTable.style.display = "none";
        this.winners.querySelector("#winner-team-title").innerHTML = "Squadra vincitrice: " + winners.squadra.squadra;
        this.winners.querySelector("#winner-atleta-title").innerHTML = "Atleta vincitore: " + winners.atleta.nome + " " + winners.atleta.cognome;

        const winner_team_data = this.winners.querySelector("#winner-team-data");
        let data = "";
        for (let key in winners.squadra) {
            if (winners.squadra.hasOwnProperty(key)) {
                data += key + " : " + winners.squadra[key] + "<br>";
            }
        }
        winner_team_data.innerHTML = "<p class = 'winner-data'>" + data + "</p>";

        const winner_atleta_data = this.winners.querySelector("#winner-atleta-data");
        data = "";
        for (let key in winners.atleta) {
            if (winners.atleta.hasOwnProperty(key)) {
                data += key + " : " + winners.atleta[key] + "<br>";
            }
        }
        winner_atleta_data.innerHTML = "<p class = 'winner-data'>" + data + "</p>";

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
        this.dataTable.style.display = "block";
        this.winners.style.display = "none";
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
