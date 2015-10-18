#require_relative 'algunmodelo?'

module Ejemplo
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    get 'hola' do
      'hey! hola'
    end
    
    get 'saludo' do
      render 'saludo'
    end

    post 'saludo' do
      session[:nombre] = params[:nombre]
      @nombre = session[:nombre]
      render 'saludo'
    end

  end
end