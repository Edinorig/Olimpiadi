export class View {
    constructor() {
        this.problem_category = document.querySelector(".problem-category");

    }

    fillProblemCategories(categories){
        console.log(categories);
        categories.forEach(category => {
            const category_option = this.createElement("option");
            category_option.value = category.id;
            category_option.innerHTML = category.tipologia;
            this.problem_category.appendChild(category_option);
        });
    }


    createElement(tag, className) {
        const element = document.createElement(tag);
        if (className) element.classList.add(className); //se hai passato una classe css la aggiunge, sennò non lo fa
        return element
    }
    
}
//# sourceMappingURL=view.js.map