# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version
  - 2.7.4
- Dependencies
  - Routes
    - FriendlyId + Babosa
      - For semantic url resource parameters(with ASCII support).
  - Test
    - factory_bot
      - Adapt `factory pattern` for building testing(or development) records in ease.
    - database_cleaner
      - Truncate database for each tests, make sure each tests are independent.
    - shoulda-matchers
      - Simple one-liner test syntax.
    - faker
      - Random data generation.

- Configuration
  - `master.key`
- Database creation
  - `rails db:create`
- Test Methodology
  - Test pyramids:
    ![Test pyramid](https://images.thoughtbot.com/rails-test-types-and-the-testing-pyramid/JH3Bd0ZOQaWZllZcE1Mg_rails-test-types.png)
    - Request test as intergration test
      - Covers routes as well.
    - Unit test
  - Priciples:
    - Fast
      - Mock behaviors from dependencies. e.g.
        - Mock ORM classes instead of performing real query:
          ```
          allow(ActiveRecord::Base).to receive(:find).and_return(double))
          ```
    - Complete
    - Reliable
    - Isolated
      - [Let's not](https://thoughtbot.com/blog/lets-not)
      - [avoid_let_spec](https://github.com/thoughtbot/guides/blob/b1399bbfd33acca56746098a22fe8b4aaae51110/testing-rspec/avoid_let_spec.rb)
      - [avoid using before and let](https://www.slideshare.net/BruceLi2)
    - Maintainable
    - Expressive
      - DAMP against DRY: Descriptive and Meaningful phrases
- TODO
