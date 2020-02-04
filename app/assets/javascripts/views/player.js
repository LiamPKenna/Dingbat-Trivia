class Question {
    constructor(questionText, questionOptions) {
        this.text = questionText;
        this.options = questionOptions;
    }
}

const playerViewHeader = (playerName) => {
    return (
        `
        <header id='player-header'>
            <style>
                #player-header {
                    height: 15vh;
                    background-color: rgba(0, 0, 0, 0.75);
                    padding: 1rem;
                    font-size: 100%;
                    margin-bottom: 5vh;
                }
                #player-header h1 {
                    height: 100%;

                    display: flex;
                    align-items: center;
                    justify-content: center;

                    font-size: ${12 - 0.4*(playerName.length)}vh;
                    line-height: ${12 - 0.4*(playerName.length)}vh;
                    text-align: center;
                    color: white;
                    overflow: hidden;
                }
            </style>

            <h1>${playerName}</h1>
        </header>
        `
    );
}
const playerViewQuestion = (questionOptions, playerID) => {
    return (
        `
        <main>
            <form id='question-form'>
                <style>
                    main {
                        width: 80%;
                        margin: 0 auto;
                    }
                    #input-options {
                        display: flex;
                        flex-direction: column;
                    }
                    .radio-button {
                        margin: 1vh;
                    }
                    .radio-button p {
                        height: 10vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 3.5vh;
                        border-radius: 10vh;

                        border: 5px solid black;
                        background-color: rgba(255, 255, 255, 0.8);
                        color: black;
                    }
                    .radio-button input:checked + .option-text {
                        border: 5px solid white;
                        background-color: rgba(0, 0, 0, 0.6);
                        color: white;
                        animation: 1s selected linear infinite;
                    }
                    @keyframes selected {
                        0%, 50%, 100% {
                            box-shadow: 0 0 6px 6px black;
                            transform: rotateZ(0deg)
                        }
                        25% {
                            box-shadow: 0 0 3px 3px black;
                            transform: rotateZ(-1.5deg);
                        }
                        75% {
                            box-shadow: 0 0 3px 3px black;
                            transform: rotateZ(1.5deg);
                        }
                    }

                    .radio-button input {
                        display: none;
                    }

                    #question-form button {
                        height: 20vh;
                        width: 20vh;
                        font-size: 10vh;
                        background-color: rgb(240, 40, 40);
                        color: white;
                        text-shadow: -3px -3px black, -3px 3px black, 3px -3px black, 3px 3px black;
                        padding: 1vh;
                        border-radius: 50%;
                        position: absolute;
                        bottom: 5vh;
                        left: calc(50vw - 11vh);
                        border: 5px solid white;
                        box-shadow: 0 0 1px 5px black;
                    }
                </style>
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
const playerView = (playerName, playerID, question) => {
    colors = [randColor(), randColor(), randColor()]
    return (
        `
        <style>
            body {
                background-image:
                    linear-gradient(
                        rgba(${colors[0]}, ${colors[1]}, ${colors[2]}, 0.65),
                        rgba(${colors[0]}, ${colors[1]}, ${colors[2]}, 0.65)
                    )/*,
                    url('background_test.gif')*/;
            }
        </style>
        ${playerViewHeader(playerName)}
        ${playerViewQuestion(question.options, playerID)}
         `
    );
}

function randColor() {
    return Math.floor(Math.random() * 255)
}
