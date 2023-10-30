document.addEventListener("turbo:click", (event) => {
  // Prevent Turbo from following the link
  event.preventDefault();
});

document.addEventListener('turbo:load', function() {
  const startDateInput = document.getElementById('startDateInput');
  const endDateInput = document.getElementById('endDateInput');
  const dateForm = document.getElementById('dateForm');

  // Function to submit the form
  function submitForm() {
    if (startDateInput.value && endDateInput.value) {
      dateForm.submit();
    }
  }

  // Attach event listeners
  startDateInput.addEventListener('change', submitForm);
  endDateInput.addEventListener('change', submitForm);
});

