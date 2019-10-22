class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    if @contact.save#contact_mail(@contact)とすることで、contact_mailメソッドを呼び出す時に、引数として@contact(お問い合わせの情報)を渡しています。
      ContactMailer.contact_mail(@contact).deliver  #ContactMailer~deliver追記することでお問い合わせ内容が保存された時にContactMailerのcontact_mailメソッドを呼び出してくれます。
      redirect_to contacts_path, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end





#
# 1. contacts_controllerのcreateアクションでお問い合わせをデータベースに保存する処理が流れる。
# 2. 1の処理が流れた時ContactMailer.contact_mail(@contact).deliverのメイラーの処理が走り、app/mailers/contact_mailer.rbのcontact_mailメソッドが呼び出される。
# 3. 引数として渡す@contactをcontact_mail(contact)の記述でcontactという引数名で受け取り、contact_mail内の処理が実行される。
#    メソッド内で@contact = contactとしているのは@contactをView(contact_mail.html.erb)で使用するため。
# 4. 処理が一通り流れ、メールがお問い合わせ者に届き、contact_mail.html.erbで記述されているHTMLが表示される。
