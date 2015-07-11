RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))
require 'minitest/autorun'
require 'rack/test'
require 'capybara'
require 'capybara/dsl'
require 'capybara/dsl'

class MiniTest::Spec
  include Rack::Test::Methods

  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app Foo::App
  #   app Foo::App.tap { |a| }
  #   app(Foo::App) do
  #     set :foo, :bar
  #   end
  #
  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end
end


class AdminAcceptanceSpec < Minitest::Spec
  Capybara.app = Soymilk::Admin
  include Capybara::DSL
  #include Capybara::Assertions
end
