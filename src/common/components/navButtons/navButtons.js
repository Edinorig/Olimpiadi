class NavButtons {
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
        <div class="wrapper-button">
            <button class="fasi calendario">
                <p> 
                    ${this.props}
                </p>
            </button>
        </div>`;
        const templateElement = parser.parseFromString(templateString, 'text/html');
        return templateElement.documentElement.querySelector("body > .wrapper-button");
    }
}
export default NavButtons;
