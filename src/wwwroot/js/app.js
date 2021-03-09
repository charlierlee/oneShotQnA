// Main function
async function answerQuestion() {
    let question = document.getElementById("question").value;

    let response = await fetch("/summary?text=" + question);
    let data = await response.json();
    document.getElementById("output").innerHTML = data.output;
}
