doctype html
html
  head
    title = page_title
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" crossorigin="anonymous"
    link rel="stylesheet" href="/dist/main.bundle.css"
    link rel="apple-touch-icon" href="/favicon.png"
    link rel="icon" href="/favicon.png"
    link rel="icon" type="image/x-icon" href="/favicon.ico"

  body
    - render_partial :navigation
    .container
      - flash.each do |key, value|
        div class="alert alert-#{key}" = value

      - yield_content

      - render_partial :footer
