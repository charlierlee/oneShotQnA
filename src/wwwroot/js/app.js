// Main function
async function answerQuestion() {
    let question = document.getElementById("question").value;

    let response = await fetch("/summary?text=" + question);
    let data = await response.json();
    document.getElementById("output").innerHTML = data.output;
}

window.onload = async function () {
    // Get the input field
    var input = document.getElementById("question");

    // Execute a function when the user releases a key on the keyboard
    input.addEventListener("keyup", async function(event) {
    // Number 13 is the "Enter" key on the keyboard
    if (event.keyCode === 13) {
        // Cancel the default action, if needed
        event.preventDefault();
        // Trigger the button element with a click
        await answerQuestion();
    }
    });
}