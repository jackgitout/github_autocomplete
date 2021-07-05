import 'js-autocomplete/auto-complete.css';
import autoComplete from 'js-autocomplete';

const results = document.querySelector('#results');

const renderItem = function (item) {
  let type;
  if (item.type === 'repo') {
    type = 'Repo: '
  } else if (item.type === 'user') {
    type = "User: "
  } 
  results.innerHTML += `<li>${type}<span>${item.name}</span></li>`;
};


const autocompleteSearch = function() {
  const searchInput = document.getElementById('query');

  
  var xhr;
  new autoComplete({
    selector: searchInput,
    minChars: 1,
    source: function(term, suggest){
      try { xhr.abort(); } catch(e){}
      xhr = $.getJSON('/autocomplete',
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
          matches.forEach((item) => {
            renderItem(item);
        });
      });
    },
  });
};

export { autocompleteSearch };