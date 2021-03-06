import 'js-autocomplete/auto-complete.css';
import autoComplete from 'js-autocomplete';

const results = document.querySelector('#results');

const renderItem = function (item) {
  let type;
  if (item.type === 'repo') {
    type = 'Repo: '
  } else if (item.type === 'user') {
    type = 'User: '
  } 
  else {
    type = 'Error: '
  }
  results.innerHTML += `<li>${type}<span>${item.name}</span></li>`;
};

const autocompleteSearch = function() {
  const searchInput = document.getElementById('query');

  new autoComplete({
    selector: searchInput,
    minChars: 1,
    source: function(term){
      $.getJSON('/autocomplete',
        { q: term },
        function(data) {
          return data;
        }).then((data) => {
          const matches = []
          data.repos.forEach((repo) => {
            matches.push({ type: 'repo', name: repo });
          });
          data.users.forEach((user) => {
            matches.push({ type: 'user', name: user });
          });
          results.innerHTML = '';  
          if (matches.length === 0) {
            matches.push({ type: 'error', name: 'API limit reached (30 calls per minute), please try again in 1 min.'} )
          }
            matches.forEach((item) => {
            renderItem(item);
        });
      });
    },
  });
};

export { autocompleteSearch };