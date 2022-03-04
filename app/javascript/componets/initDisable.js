const enable = (target, btn, empty) => {
  target.addEventListener('keyup', () => {
    if (target.value.length == 0) {
      btn.setAttribute('disabled', 'disabled');
    } else {
      btn.removeAttribute('disabled');
    }
  });
};

const initDisable = () => {
  const input = document.querySelector('#search_title');
  const submit = document.querySelector('form input.btn.btn-primary.dis');
    enable(input, submit);
};

export { initDisable };
