/* class Header extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: 'open' });
        if (this.shadowRoot != null)
            this.shadowRoot.innerHTML = `
            <div class ="header">
                <a href="../../index.php" class = "logo"><img src = "../common/assets/header_logo.svg" class = "logo"></a>
            </div>`;
    }
}
customElements.define('header-component', Header); */

class Header {
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
        const parser = new DOMParser();
        const templateString = `
        <header>
            <div class ="header">
                <a href="../../index.php" class = "logo"><img src = "../common/assets/header_logo.svg" class = "logo"></a>
            </div>
        </header>`;
        const templateElement = parser.parseFromString(templateString, 'text/html');
        return templateElement.documentElement.querySelector("body > header");
    }
}
export default Header;
