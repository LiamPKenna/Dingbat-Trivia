const dashboardMain = () => {
    return(
        `
        <main>
            <div id='player-column-1'>
            </div>
            <div id='main-display'>
                <div id='info-display'>
                </div>
                <div id='question-display'>
                    <h2>Waiting for question...</h2>
                </div>
                <ul id='update-display'>
                </ul>
            </div>
            <div id='player-column-2'>
            </div>
        </main>
        `
    );
}
const dashboardPlayerColumn = (columnNum, playerArray) => {
    $()
}

const dashboardPlayerPortrait = (player) => {
    return (
        `
        <div class='player-portrait'>
            <div id="player-${player.id}">
                <h2>${player.name}</h2>
                <p>${player.score}</p>
            </div>
        </div>
        `
    );
}
const sendUpdate = (updateText) => {
    $('#update-display').prepend(`<li>${updateText}</li>`);
}
const sendMainText = (questionText) => {
    $('#question-display h2').text(questionText);
}
const addDashboardPlayerPortrait = (player, playerCount) => {
    const column = (playerCount % 2 === 0) ? 2 : 1;
    $(`#player-column-${column}`).append(dashboardPlayerPortrait(player));
}
const updatePlayerScore = (playerID, newScore) => {
    $(`#player-${playerID} p`).text(newScore)
}
const demoDashboardView = (playerCount) => {
    $('body').append(
        `
        ${dashboardMain()}
        `
    );
}

class Player {
    constructor(id, name, score){
        this.id = id;
        this.name = name;
        this.score = score;
    }
}
