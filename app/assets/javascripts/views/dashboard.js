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

const dashboardQuestionSlide = () => {
    return (`<h3 class='q-slide'>Next Question</h3>`);
}
const dashboardQuestionSmack = (questionText) => {
    return (`<h3 id='question' class='q-smack'>${questionText}</h3>`);
}


//verbs
const sendQuestion = (questionText) => {
    $('#question-display').empty();
    $('#question-display').prepend(dashboardQuestionSlide);
    setTimeout( () => {
        $('.q-slide').remove();
        $('#question-display').prepend(dashboardQuestionSmack(`Q: ${questionText}`));
        setTimeout( () => {
            $('#question').removeClass('q-smack');
            $('#question').addClass('q-hover');
        }, 500);
    }, 1750);
    $('#question-display p').text(questionText);
}
const sendAnswer = (answerText) => {
    $('#question')
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
