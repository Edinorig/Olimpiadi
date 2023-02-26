class SearchWrapper {
    constructor(parent, props) {
        this.parentElement = parent;
        this.props = props;
        this.template;
        this.elements = {};
    }

    init() {
        this.initElements();
        this.initEventListeners();
    }

    initElements() {
        this.template = this.initTemplate();
        this.parentElement.appendChild(this.template);
    }

    initEventListeners() {
    }

    initTemplate() {
        ;
        const parser = new DOMParser();
        const templateString = `
        <div class="wrapper-search-bar">
            <input type="text" id="search" placeholder="Cerca nome atleta...">
            <button id="search-btn">Cerca</button>
        </div>`;
        const templateElement = parser.parseFromString(templateString, 'text/html');
        return templateElement.documentElement.querySelector("body > .wrapper-search-bar");
    }
}
export default SearchWrapper;
