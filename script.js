//Command Panel
document.addEventListener('DOMContentLoaded', function() {
    // Link every needed data from PHP and JS
    const chatForm = document.getElementById('chat-form'); // Text form
    const chatMessages = document.getElementById('chat-messages'); // PHP's answer
    const userMessageInput = document.getElementById('user-message'); // User's Input

    chatForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const userMessage = userMessageInput.value.trim();

        // If there is nothing in input, do nothing
        if (userMessage === '') {
            return;
        }

        // Send request to PHP
        fetch('chatbot.php', {
            method: 'POST',
            body: new URLSearchParams({ user_message: userMessage }),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
        })
        .then(response => response.json())
        .then(data => {
            const chatbotResponse = data.response; // Select PHP's answer
            
            // Clear previous answer to user's input
            chatMessages.innerHTML = '';

            // Create a new chat message element for the chatbot's response
            const messageDiv = document.createElement('div');
            messageDiv.classList.add('message');
            messageDiv.classList.add('bot'); // Apply CSS classes for styling
            
            messageDiv.textContent = chatbotResponse; // Set the chatbot's response as the content of the message
            chatMessages.appendChild(messageDiv); // Add the message element to the chat container

            // Clear the user input field
            userMessageInput.value = '';
        })
        .catch(error => {
            console.error('Error:', error); // Log errors during fetch request
        });
    });
});

// Clock
  function startTime() {
    const today = new Date();
    let h = today.getHours();
    let m = today.getMinutes();
    let s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('clock').innerHTML =  h + ":" + m + ":" + s;
    setTimeout(startTime, 1000);
  }
  
  function checkTime(time) {
    if (time < 10) {time = "0" + time};  
    return time;
  }

//letters changing magic :o

const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const frequency = "30";

let interval = null;

document.querySelector("h1").onmouseover = event => {  
  let iteration = 0;
  
  clearInterval(interval);
  
  interval = setInterval(() => {
    event.target.innerText = event.target.innerText
      .split("")
      .map((letter, index) => {
        if(index < iteration) {
          return event.target.dataset.value[index];
        }
      
        return letters[Math.floor(Math.random() * letters.length)]
      })
      .join("");
    
    if(iteration >= event.target.dataset.value.length){ 
      clearInterval(interval);
    }
    
    iteration += 1 / 3;
  }, frequency); // How fast it changes the letters
}