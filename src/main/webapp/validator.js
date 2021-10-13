document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("submit_button").addEventListener("click", submit)
})

let submit = function (e){
    let x = document.getElementById("x")
    x.value = x.value.trim().substr(0, 12).replace(',', '.')
    let y = document.getElementsByName("y_value")
    let r = document.getElementsByName("r_value")
    if (!check(x, y, r)) {
        e.preventDefault()
    }
}

function check(x, y ,r) {
    if (x.value === "") {
        error("Enter the X value")
        return false
    }
    if (!isFinite(x.value)) {
        error("X must be a number")
        return false;
    }
    if (x.value <= -3 || x.value >= 5) {
        error("X value must be in range (-3 ... 5)")
        return false;
    }
    let y_checked = false
    for (let y_checkbox of y) {
        if (y_checkbox.checked) {
            if (!y_checked) {
                y_checked = true
            } else {
                error("Only one Y value needs to be selected")
                return false
            }
        }
    }
    let yValue = document.querySelector("input[name=y_value]:checked").value
    if (yValue < -3 || yValue > 5){
        error("Y value must be in range [-3 ... 5]")
        return false
    }
    let r_checked = false
    for (let r_radio of r) {
        if (r_radio.checked){
            r_checked = true
            break
        }
    }
    if (!y_checked){
        error("Y value must be selected")
        return false
    }
    if (!r_checked) {
        error("R value must be selected")
        return false
    }
    return true
}

function error(msg) {
    let errField = document.getElementById("error_message")
    let err = document.getElementById("error")
    errField.innerText = msg
    err.hidden = false
    setTimeout(() => {
        err.hidden = true
    }, 3000)
}
