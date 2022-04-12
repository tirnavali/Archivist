Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    #origins 'localhost:3000', '127.0.0.1:3000', /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/
    origins '*'
    resource '*', 
      headers: :any, 
      methods: [:get, :post, :patch, :put, :options],
      max_age: 600
  end
end