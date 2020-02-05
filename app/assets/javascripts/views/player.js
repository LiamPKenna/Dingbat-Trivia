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
    </form>
    `
  );
}
const playerQuestionLabel = (text, index, playerID) => {
  return (
    `
    <button type="button" class="answer-go" name="button" value='${index + 1}'>${text}</button>
    `
    // <label class='radio-button'>
    // <input type='radio' name='player-answer' value='${index + 1}'>
    //   <p class='option-text'>${text}</p>
    // </label>
  );
}

//verbs
const demoPlayerQuestion = (playerName, playerID) => {
  sampleOptions = ['Red', 'Blue', 'Green', 'Yellow'];
  $('main').append( playerQuestion(sampleOptions, playerID) );
}

const removePlayerQuestion = () => {
  $('#question-form').remove();
}
const addPlayerAnswers = (answers, playerID) => {
  removePlayerQuestion();
  $('main').append( playerQuestion(answers, playerID) );
}

function hashToArray(hash) {
  return [hash['a1'], hash['a2'], hash['a3'], hash['a4']];
}
