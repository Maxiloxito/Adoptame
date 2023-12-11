class AdopcionMailer < ApplicationMailer
  def solicitud_adopcion(adopcion)
    @adopcion = adopcion
    mail(to: 'organizacion@example.com', subject: 'Solicitud de adopción')
  end
 end
 