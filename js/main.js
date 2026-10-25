// Light switcher
const lightSwitches = document.querySelectorAll('.light-switch');
if (lightSwitches.length > 0) {
  lightSwitches.forEach((lightSwitch, i) => {
    if (localStorage.getItem('dark-mode') === 'true') {
      // eslint-disable-next-line no-param-reassign
      lightSwitch.checked = true;
    }
    lightSwitch.addEventListener('change', () => {
      const { checked } = lightSwitch;
      lightSwitches.forEach((el, n) => {
        if (n !== i) {
          // eslint-disable-next-line no-param-reassign
          el.checked = checked;
        }
      });
      document.documentElement.classList.add('[&_*]:!transition-none');
      if (lightSwitch.checked) {
        document.documentElement.classList.add('dark');
        document.querySelector('html').style.colorScheme = 'dark';
        localStorage.setItem('dark-mode', true);
        document.dispatchEvent(new CustomEvent('darkMode', { detail: { mode: 'on' } }));
      } else {
        document.documentElement.classList.remove('dark');
        document.querySelector('html').style.colorScheme = 'light';
        localStorage.setItem('dark-mode', false);
        document.dispatchEvent(new CustomEvent('darkMode', { detail: { mode: 'off' } }));
      }
      setTimeout(() => {
        document.documentElement.classList.remove('[&_*]:!transition-none');
      }, 1);
    });
  });
}


document.getElementById('scanUrlButton').addEventListener('click', function(event) {
  event.preventDefault(); // Prevent the default form submission behavior
  const urlToScan = document.getElementById('urlInput').value;
  const spinner = document.getElementById('spinner');
  const results = document.getElementById('results');
  const resultsContent = document.getElementById('resultsContent');
  const enginesReport = document.getElementById('engines-report');
  const scanDetails = document.getElementById('scan-details');

  // Show the spinner and hide the results
  spinner.classList.remove('hidden');
  // results.classList.add('hidden');

  // Use local server endpoint (/scan) with fallback
  const scanEndpoint = (window.location.protocol === 'http:' || window.location.protocol === 'https:') ? '/scan' : 'https://scantotal.onrender.com/scan';

  fetch(scanEndpoint, {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json'
      },
      body: JSON.stringify({ url: urlToScan })
  })
  .then(response => response.json())
  .then(data => {
      console.log('Success:', data);
      // Handle the response data here
      const resultsData = data.data.attributes.results;
      const stats = data.data.attributes.stats;

      enginesReport.innerHTML = ''; // Clear previous results
      scanDetails.innerHTML = ''; // Clear previous details

      // Display harmless, malicious, suspicious, and undetected counts
      scanDetails.innerHTML = `
          <li class="px-5 py-4 rounded-lg bg-gradient-to-tr from-slate-950 to-slate-800 dark:from-slate-800/80 dark:to-slate-900">
              <div class="text-slate-200 font-medium">Harmless: ${stats.harmless}</div>
          </li>
          <li class="px-5 py-4 rounded-lg bg-gradient-to-tr from-slate-950 to-slate-800 dark:from-slate-800/80 dark:to-slate-900">
              <div class="text-slate-200 font-medium">Malicious: ${stats.malicious}</div>
          </li>
          <li class="px-5 py-4 rounded-lg bg-gradient-to-tr from-slate-950 to-slate-800 dark:from-slate-800/80 dark:to-slate-900">
              <div class="text-slate-200 font-medium">Suspicious: ${stats.suspicious}</div>
          </li>
          
      `;

      // Display engine results
      for (const engine in resultsData) {
          const result = resultsData[engine];
          const listItem = document.createElement('li');
          listItem.className = 'px-5 py-4 rounded-lg bg-gradient-to-tr from-slate-950 to-slate-800 dark:from-slate-800/80 dark:to-slate-900';
          const resultClass = result.result === 'clean' ? 'text-green-500' : 'text-slate-400';
          listItem.innerHTML = `
              <div class="text-slate-200 font-medium">${result.engine_name}</div>
              <div class="${resultClass}">${result.result}</div>
          `;
          enginesReport.appendChild(listItem);
      }

      // Check if the link is safe
      const prevMessage = document.getElementById('safeStatusMessage');
      if (prevMessage) prevMessage.remove();

      const safeMessage = document.createElement('div');
      safeMessage.id = 'safeStatusMessage';
      if (stats.harmless > stats.malicious && stats.harmless > stats.suspicious) {
          safeMessage.className = 'text-green-500 font-bold mb-4';
          safeMessage.textContent = 'The link is safe.';
      } else {
          safeMessage.className = 'text-red-500 font-bold mb-4';
          safeMessage.textContent = `Warning: ${stats.malicious} malicious / ${stats.suspicious} suspicious threat(s) detected!`;
      }
      scanDetails.insertAdjacentElement('beforebegin', safeMessage);

      // Hide the spinner and show the results
      spinner.classList.add('hidden');
      // results.classList.remove('hidden');
  })
  .catch((error) => {
      console.error('Error:', error);
      // Hide the spinner even if there's an error
      spinner.classList.add('hidden');
  });
});