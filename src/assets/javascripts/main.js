import "http_method_emulator";

document.addEventListener("DOMContentLoaded", function () {
  const elements = document.querySelectorAll("a[data-method='delete']");
  let i;
  for (i = 0; i < elements.length; i++) {
    elements[i].addEventListener("click", function (e) {
      e.preventDefault();
      const message = e.target.getAttribute("data-confirm") || "Are you sure?";
      if (confirm(message)) {
        const form = document.createElement("form"),
          input = document.createElement("input");
        const url = new URL(e.target.getAttribute("href"), location.origin);
        url.searchParams.set("_method", "DELETE");
        form.action = url.href;
        form.setAttribute("method", "POST");

        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
      }
      return false;
    })
  }
});

const removeAlert = (time) => {
  const $alert = document.querySelector('.alert')
  if ($alert) {
    setTimeout(() => {
      $alert.remove()
    }, time);
  }
}

removeAlert(2000)
