import 'js-autocomplete/auto-complete.css';
import autoComplete from 'js-autocomplete';

const renderItem = function (item) {
  return `<div class="autocomplete-suggestion"><span>${item.name}</span></div>`
};


const autocompleteSearch = function() {
  const searchInput = document.getElementById('query');

  new autoComplete({
    selector: searchInput,
    minChars: 1,
    source: function(term, suggest){
      $.getJSON('/autocomplete',
        { q: term },
        function(data) {
          return data;
        }).then((data) => {
          const matches = []
          data.repos.forEach((repo) => {
            matches.push({type: 'repo', name: repo });
          });
          data.users.forEach((user) => {
            matches.push({type: 'user', name: user });
          });
        suggest(matches)
      });
    },
    renderItem: renderItem,
  });
};

export { autocompleteSearch };