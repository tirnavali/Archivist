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
pin "cocoon", to: "https://cdn.jsdelivr.net/npm/@nathanvda/cocoon@1.2.14/cocoon.min.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin "sifter", to: "https://ga.jspm.io/npm:sifter@0.5.4/sifter.js", preload: true
pin "microplugin", to: "https://ga.jspm.io/npm:microplugin@0.0.3/src/microplugin.js", preload: true
pin "selectize", to: "https://cdn.jsdelivr.net/npm/selectize@0.12.6/dist/js/selectize.js"
