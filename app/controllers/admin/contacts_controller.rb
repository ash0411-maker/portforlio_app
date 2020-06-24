class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!, only: %i[edit update index]

  def index
    @contacts = Contact.all.order(created_at: :desc)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to admin_contact_thanks_path
    else
      render 'new'
    end
  end

  def thanks; end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id]) # contact_mailer.rbの引数を指定
    if contact.update(contact_params)
      ContactMailer.send_when_admin_reply(contact, contact.admin_text).deliver
      redirect_to admin_home_top_path
      flash[:notice] = 'お問い合わせへの返信ができました。'
    else
      render 'edit'
  end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_text, :admin_text)
  end
end
