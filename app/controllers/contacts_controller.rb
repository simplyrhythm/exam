class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def thanks
    if id = flash[:contact_id] and id.present?
      @contact = Contact.find(id)
      flash[:contact_id] = @contact.id
    else
      redirect_to('/contacts') and return
    end
  end

  def create
    p_params = permit_create_params
    Contact.transaction do
      @contact = Contact.create!(
        name: p_params[:contact][:name].to_s,
        email: p_params[:contact][:email].to_s,
        message: p_params[:contact][:message].to_s,
      )
    end
    flash[:contact_id] = @contact.id
    redirect_to('/contacts/thanks') and return
  rescue => e
    case e
    when ActiveRecord::RecordInvalid
      @contact = e.record
      render action: :new and return
    end
  end

  private
  def permit_create_params
    params.permit(contact: [:name, :email, :message])
  end
end
