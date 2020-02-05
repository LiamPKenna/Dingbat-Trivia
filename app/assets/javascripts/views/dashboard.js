const dashboardPlayerPortrait = (player) => {
    return (
        `
        <div class='player-portrait spin-up' id='portrait-${player.id}'>
            <div id='player-${player.id}'>
                <h2>${player.name}</h2>
                <p>${player.score}</p>
            </div>
        </div>
        `
    );
}

//verbs
const sendUpdate = (updateText) => {
    $('#update-display ul').prepend(`<li>${updateText}</li>`);
}
const sendMainText = (questionText) => {
    $('#question-display h2').text(questionText);
}
const addDashboardPlayerPortrait = (player, playerCount) => {
    const column = (playerCount % 2 === 0) ? 2 : 1;
    $(`#player-column-${column}`).append(dashboardPlayerPortrait(player));
    const portrait = $(`#portrait-${player.id}`);
    setTimeout(() => {
        portrait.removeClass('spin-up');
        portrait.addClass('wiggle');
    }, 350);
}
const updatePlayerScore = (playerID, newScore) => {
    $(`#player-${playerID} p`).text(newScore)
}

const updateQuestionNumber = (newNumber) => {
    $('#question-number').text(newNumber)
}

//extra
class Player {
    constructor(id, name, color, icon, score){
        this.id = id;
        this.name = name;
        this.color = color;
        this.icon = icon;
        this.score = score;
    }
}
