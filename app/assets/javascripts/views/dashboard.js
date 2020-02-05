const dashboardPlayerPortrait = (player) => {
    return (
        `
        <div class='player-portrait spin-up' id='portrait-${player.id}'>
          <style>
            #portrait-${player.id} {
              background-color: rgba(${player.color[0]}, ${player.color[1]}, ${player.color[2]}, 0.65)
            }
          </style>
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


const sendCorrectPlayers = (arr) => {}

const sendWinners = (arr) => {}

const updateQuestionNumber = (newNumber) => {
    $('#question-number').text(newNumber)
}

//extra
class Player {
    constructor(data){
        this.id = data['id'];
        this.name = data['name'];
        this.color = data['player_color'].split(' ');
        this.icon = data['player_icon'];
        this.score = 0;
    }
}
