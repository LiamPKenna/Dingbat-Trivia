const playerQuestion = (questionOptions, playerID) => {
  return (
    `
      <div id='input-options'>
      ${
        questionOptions.map(
          (option, index) => {
            return playerQuestionLabel(option, index);
          }
        ).join('\n')
      }
      </div>
    `
  );
}
const playerQuestionLabel = (text, index) => {
  return (`<button type="button" class="answer-go" value='${index + 1}'>${text}</button>`);
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
