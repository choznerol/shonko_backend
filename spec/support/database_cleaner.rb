RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:db_cleaner_strategy] || :transaction
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
