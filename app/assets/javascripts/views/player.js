class Question {
    constructor(questionText, questionOptions) {
        this.text = questionText;
        this.options = questionOptions;
    }
}

const playerViewQuestion = (questionOptions, playerID) => {
    return (
        `
        <main>
            <form id='question-form'>
                <div id='input-options'>
                    ${
                        questionOptions.map(
                            (option, index) => {
                                return playerViewQuestionLabel(option, index, playerID);
                            }
                        ).join('\n')
                    }
                </div>
                <button type='submit'>Go!</button>
            </form>
        </main>
        `
    );
}
const playerViewQuestionLabel = (text, index, playerID) => {
    return (
        `
        <label class='radio-button'>
            <input type='radio' name='playerAnswer' player-id="${playerID}" value='${index + 1}'>
            <p class='option-text'>${text}</p>
        </label>
        `
    );
}

const playerViewStyles = (playerName) => {
    const randColor = () => {
        return Math.floor(Math.random() * 255)
    }
    colors = [randColor(), randColor(), randColor()]

    return (
        `
        <style id='player-view-styles'>
            body {
                background-image:
                    linear-gradient(
                        rgba(${colors[0]}, ${colors[1]}, ${colors[2]}, 0.65),
                        rgba(${colors[0]}, ${colors[1]}, ${colors[2]}, 0.65)
                    );
            }
            main {
                width: 80%;
                margin: 0 auto;
            }
            #player-header h1 {
                font-size: ${12 - 0.4*(playerName.length)}vh;
                line-height: ${12 - 0.4*(playerName.length)}vh;
            }
        </style>
        `
    );
}
const demoPlayerView = (playerName, playerID) => {
    sampleQuestion = new Question(
        'What\'s the best color?',
        ['Red', 'Blue', 'Green', 'Yellow']
    );
    $('body').append(
        `
        ${playerViewStyles(playerName)}
        ${playerViewQuestion(sampleQuestion.options, playerID)}
         `
    );
}
