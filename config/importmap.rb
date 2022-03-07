# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js", preload: true
pin "vanilla-nested", to: "https://cdn.jsdelivr.net/npm/vanilla-nested@1.6/app/assets/javascripts/vanilla_nested.min.js", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "@rails/activestorage", to: "activestorage.esm.js"
pin "semantic-ui", to: "https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js", preload: true
pin "select2", to: "https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js" 

pin_all_from "app/javascript/controllers", under: "controllers"