class Header extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: 'open' });
        if (this.shadowRoot != null)
            this.shadowRoot.innerHTML = `
            <style>
            body{
                margin: 0;
            }
            .header{
                position: fixed;
                top: 0;
                left: 0;
                height: 120px;
                width: 100%;
                display: flex;
                justify-content: start;
                align-items: center;
            }
            .logo{
                height: 100%;
            }
            </style>
            <div class = "header">
                <a href="../../index.php" class = "logo"><img src = "../common/assets/logo.png" class = "logo"></a>
            </div>`;
    }
}
customElements.define('header-component', Header);
