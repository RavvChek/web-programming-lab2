export default class Graph {
    svgPoint

    constructor() {
        this.svgPoint = document.querySelector('svg').createSVGPoint();
    }

    getSvgPoint() {
        return this.svgPoint
    }

    drawDot(x, y, r, isHit, valOfDiv) {
        const radius = 3
        const svgns = "http://www.w3.org/2000/svg"
        const svg = document.querySelector('svg');
        const dotsObjects = sessionStorage.getItem("dotsObjects") ? JSON.parse(sessionStorage.getItem("dotsObjects")) : [];
        const dotObject = {
            x: x,
            y: y,
            r: r,
            isHit: isHit,
            radius: radius,
            valOfDiv: valOfDiv
        };
        const dot = document.createElementNS(svgns, 'circle')
        dot.setAttributeNS(null, 'cx', isHit ? x : 150 + valOfDiv * x);
        dot.setAttributeNS(null, 'cy', isHit ? y : 150 - valOfDiv * y);
        dot.setAttributeNS(null, 'class', "target-dot");
        dot.setAttributeNS(null, 'r', radius.toString());
        dot.setAttributeNS(null, 'style', 'fill: white; stroke: black;');
        console.log(dot)
        svg.appendChild(dot);
        dotsObjects.push(JSON.stringify(dotObject));
        console.log(dotsObjects)
        sessionStorage.setItem('dotsObjects', JSON.stringify(dotsObjects));
    }

    restoreDots() {
        const svg = document.querySelector('svg');
        const svgns = "http://www.w3.org/2000/svg"
        if (sessionStorage.getItem("dotsObjects")) {
            JSON.parse(sessionStorage.getItem("dotsObjects")).forEach(value => {
                const dot = JSON.parse(value);
                const dotElement = document.createElementNS(svgns, 'circle');
                dotElement.setAttributeNS(null, 'cx', dot.isHit ? dot.x : 150 + dot.valOfDiv * dot.x);
                dotElement.setAttributeNS(null, 'cy', dot.isHit ? dot.y : 150 - dot.valOfDiv * dot.y);
                dotElement.setAttributeNS(null, 'class', "target-dot");
                dotElement.setAttributeNS(null, 'r', dot.radius.toString());
                dotElement.setAttributeNS(null, 'style', 'fill: black; stroke: black;');
                svg.appendChild(dotElement);
            });
        }
    }
}