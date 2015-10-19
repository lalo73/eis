#require_relative 'algunmodelo?'

module Ejemplo
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    get '' do
      render 'index'
    end

    post '' do
      @resultado = params[:operand1].to_i + params[:operand2].to_i
      render 'index'
    end

  end
end