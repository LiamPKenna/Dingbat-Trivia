const playerQuestion = (questionOptions, playerID) => {
    return (
        `
        <form id='question-form'>
            <div id='input-options'>
            ${
                questionOptions.map(
                    (option, index) => {
                        return playerQuestionLabel(option, index, playerID);
                    }
                ).join('\n')
            }
            </div>
            <button type='submit'>Go!</button>
        </form>
        `
    );
}
const playerQuestionLabel = (text, index, playerID) => {
    return (
        `
        <label class='radio-button'>
            <input type='radio' name='playerAnswer' player-id="${playerID}" value='${index + 1}'>
            <p class='option-text'>${text}</p>
        </label>
        `
    );
}
const playerWaiting = () => {
    return (
        `
        <div id='waiting'>
            <h2>
                Waiting for next question<span id=dot1>.</span><span id=dot2>.</span><span id=dot3>.</span>
            </h2>
        </div>
        `
    );
}

//verbs
const demoPlayerQuestion = (playerName, playerID) => {
    sampleOptions = ['Red', 'Blue', 'Green', 'Yellow'];
    $('main').append( playerQuestion(sampleOptions, playerID) );
}

const removePlayerQuestion = () => {
    $('#question-form').remove();
    $('main').append(playerWaiting());
}
const addPlayerQuestion = (questionOptions, playerID) => {
    $('#waiting').remove();
    $('main').append( playerQuestion(questionOptions, playerID) );
}

function hashToArray(hash) {
    return [hash['a1'], hash['a2'], hash['a3'], hash['a4']];
}
