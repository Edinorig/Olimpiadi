class Header extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: 'open' });
        if (this.shadowRoot != null)
            this.shadowRoot.innerHTML = ``;
    }
}
customElements.define('header-component', Header);
