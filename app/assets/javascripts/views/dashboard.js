const dashboardPlayerPortrait = (player) => {
    return (
        `
        <div class='player-portrait' id='portrait-${player.id}'>
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
const dashboardAnswerSwirl = (answerText) => {
    return (`<h3 id='answer' class='a-swirl'>${answerText}</h3>`);
}

const winnerDisplay = (arr) => {
    const players = arr.map(e => {return new Player(e);});
    const portraits = players.map(e => {return dashboardPlayerPortrait(e)});
    return (
        `
        <div id='final'>
            <h1 id='you-win'>Winner${(arr.length > 1) ? 's' : ''}!</h1>
            <div id='winners'>
                ${portraits.join('\n')}
            </div>
        </div>
        `
    );
}

//verbs
const sendQuestion = (questionText) => {
    qDisplay = $('#question-display');
    qDisplay.empty();
    qDisplay.prepend(dashboardQuestionSlide);
    setTimeout( () => {
        $('.q-slide').remove();
        qDisplay.prepend(dashboardQuestionSmack(`Q: ${questionText}`));
        setTimeout( () => {
            $('#question').removeClass('q-smack');
            $('#question').addClass('q-hover');
        }, 400);
    }, 1750);
}
const sendAnswer = (answerText) => {
    const question = $('#question');
    question.removeClass('q-hover');
    question.addClass('q-flick');
    setTimeout( () => {
        question.remove();
        $('#question-display').prepend(dashboardAnswerSwirl(`A: ${answerText}`));
    }, 500);
    setTimeout( () => {
        $('#answer').remove();
    }, 4500)
}

const addDashboardPlayerPortrait = (player, playerCount) => {
    const column = (playerCount % 2 === 0) ? 2 : 1;
    $(`#player-column-${column}`).append(dashboardPlayerPortrait(player));
    const portrait = $(`#portrait-${player.id}`);
    portrait.addClass('spin-up')
    setTimeout(() => {
        portrait.removeClass('spin-up');
        portrait.addClass('wiggle');
    }, 350);
}
const updatePlayerScore = (playerID, newScore) => {
    $(`#player-${playerID} p`).text(newScore);
}


const sendCorrectPlayers = (arr) => {}

const sendWinners = (arr) => {
    $('main').fadeOut(1500);
    setTimeout( () => {
        $('main').remove();
        $('body').append(winnerDisplay(arr));
        $('#final').fadeIn(1500);
    }, 1500);
}

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
