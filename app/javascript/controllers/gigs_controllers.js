document.addEventListener('turbo:load', () => {
  console.log("JS loaded"); // DEBUG: make sure this prints

  const checkboxes = document.querySelectorAll('.filter-checkbox');
  console.log("Checkboxes:", checkboxes.length); // DEBUG

  checkboxes.forEach(box => {
    box.addEventListener('change', () => {
      console.log("Checkbox clicked:", box.value, box.checked); // DEBUG
    });
  });
});
