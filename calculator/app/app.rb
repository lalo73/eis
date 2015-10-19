#require_relative 'algunmodelo?'

module Ejemplo
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    get '' do
      @operations ||= session[:operations] || 0
      render 'index'
    end

    post '' do
      @operations = session[:operations] = (session[:operations] || 0) + 1
      @resultado = operate(params[:operand1].to_i, params[:operand2].to_i)
      render 'index'
    end

    post '/reset-operations' do
      session[:operations] = 0
      redirect_to "/"
    end

    private

    def operate(operand1, operand2)
      factory.send(params[:operation].to_sym).operate operand1, operand2
    end

    def factory
      OperatorFactory.new
    end
  end
end
