import Validator from "./Validator.js";

export default class App {

    constructor(graph) {
        this.graph = graph;
        this.submitButton = document.querySelector("input[type=submit]");
        this.submitButton.disabled = true;
        this.svgElem = document.querySelector("svg");
        this.resetButton = document.querySelector("input[type=reset]")
    }

    init() {
        const submitBtn = this.submitButton
        document.addEventListener('DOMContentLoaded', () => {
            this.graph.restoreDots();
            const xInput = document.getElementById('x')
            const yInput = document.getElementById('y')
            yInput.addEventListener('input', function () {
                const yValue = yInput.value;
                const xValue = xInput.value
                submitBtn.disabled = !(!isNaN(yValue) && yValue >= -5 && yValue <= 5 && Validator.regex.test(yValue));
                if (submitBtn.disabled) {
                    yInput.setCustomValidity("Enter a number between -5 and 5");
                    yInput.reportValidity();
                    return false;
                } else {
                    yInput.setCustomValidity("");
                    yInput.reportValidity();
                    return true;
                }
            });

            xInput.addEventListener('input', function () {
                const yValue = yInput.value;
                const xValue = xInput.value;
                submitBtn.disabled = !(!isNaN(xValue) && xValue >= -5 && xValue <= 5 && Validator.regex.test(xValue));
                if (submitBtn.disabled) {
                    xInput.setCustomValidity("Enter a number between -5 and 5");
                    xInput.reportValidity();
                    return false;
                } else {
                    xInput.setCustomValidity("");
                    xInput.reportValidity();
                    return true;
                }
            })
        })

        this.submitButton.addEventListener('click', event => {
            event.preventDefault();
            const x = document.getElementById('x')
            const y = document.getElementById('y')
            const r = document.getElementById('r')
            if (y.value === "" || x.value === "" || r.value === "") {
                if (y.value === "") {
                    y.setCustomValidity("No data has been entered!");
                    y.reportValidity();
                    return false;
                }
                if (x.value === "") {
                    x.setCustomValidity("No data has been entered!");
                    x.reportValidity();
                    return false;
                }
            }
            if (!Validator.isValid(x.value, y.value, r.value)) {
                y.setCustomValidity("Wrong type data!");
                y.reportValidity();
                return false;
            }
            this.graph.drawDot(x.value, y.value, r.value, false, 100 / r.value)
            const formData = new FormData();
            formData.append("y", y.value);
            formData.append("r", r.value);
            formData.append("x ", x.value);
            fetch("/web2lab-1.0-SNAPSHOT/controller", {
                method: "POST",
                body: formData
            })
                .then(response => response.text())
                .then(data => {
                    document.write(data);
                })
        })
        this.svgElem.addEventListener('click', (event) => {
            this.graph.svgPoint.x = event.clientX
            this.graph.svgPoint.y = event.clientY
            const point = this.graph.svgPoint.matrixTransform(document.querySelector('svg')
                .getScreenCTM()
                .inverse())
            const r = document.getElementById("r")
            const valOfDiv = 100 / r.value
            this.graph.drawDot(point.x, point.y, r.value, true, valOfDiv)
            const formData = new FormData();
            formData.append("x", `${((point.x - 150) / valOfDiv).toFixed(2)}`);
            formData.append("y", `${((150 - point.y) / valOfDiv).toFixed(2)}`);
            formData.append("r", r.value);
            fetch("/web2lab-1.0-SNAPSHOT/controller", {
                method: "POST",
                body: formData
            })
                .then(response => response.text())
                .then(data => {
                    document.write(data);
                })
        })
    }
}
