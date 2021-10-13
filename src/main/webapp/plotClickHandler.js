document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("plot-svg").addEventListener("click", handleClick)
})

let handleClick = function(e){
    let svg = document.getElementById("plot-svg")
    let pt = svg.createSVGPoint()
    pt.x = e.clientX
    pt.y = e.clientY
    pt = pt.matrixTransform(svg.getScreenCTM().inverse())
    try {
        r = document.querySelector("input[name=r_value]:checked").value
        x = (-150 + pt.x) / 100 * r
        y = (150 - pt.y) / 100 * r
        if (checkValues(x, y)) {
            let request = new XMLHttpRequest()
            request.open('GET', 'controller-servlet?x_value=' + (x + "").substr(0, 12) +
                '&y_value=' + (y + "").substr(0, 12) + '&r_value=' + r, false)
            request.send(null)
            location.reload()
        }
    } catch (e) {
        error("R value must be selected")
    }
}

function checkValues(x, y){
    if (x <= -3 || x >= 5) {
        error("X value must be in range (-3 ... 5)")
        return false;
    }
    if (y < -3 || y > 5){
        error("Y value must be in range [-3 ... 5]")
        return false
    }
    return true
}