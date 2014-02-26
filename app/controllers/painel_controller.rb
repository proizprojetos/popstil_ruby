class PainelController < ApplicationController
  before_filter :authorize, except: [:cadastrar, :salvar]
  before_filter :user_logged, only: [:cadastrar]
  before_action :set_user, only: [:editar, :update, :show_dados, :salvar_endereco]
  
  #GET /painel/cadastrar
  def cadastrar
    @user = User.new
    @user.endereco.build
  end
  
  def dashboard
    
  end
  
  
  #POST /painel
  def salvar
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Seu cadastro foi realizado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'cadastrar' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #GET /painel/editar/:id
  def editar
  end
  
  #PUT /painel/editar/:id
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to painel_path, notice: 'Seu cadastro foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'editar' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #GET /painel/meusdados
  def show_dados
    
  end
  
  def definir_endereco
    begin
    endereco = Endereco.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    end
    if endereco
      endereco.user.endereco.update_all(:principal => '0')
      endereco.update_attributes(:principal => '1')
      redirect_to painel_meusdados_path, notice: 'Endereco principal alterado'
    else
    redirect_to painel_meusdados_path, notice: 'Endereco nao encontrado, tente novamente '    
    end  
  end
  
  def adicionar_endereco
    @endereco = Endereco.new
  end
  
  def salvar_endereco
    @endereco = Endereco.new(endereco_params)
    @endereco.user = @user
    @endereco.principal = '0'
    respond_to do |format|
      if @endereco.save
        format.html { redirect_to painel_meusdados_path, notice: 'Seu endereco foi adicionado com sucesso.' }
      else
        format.html { render action: 'adicionar_endereco' }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_user
    @user = User.find(session[:user_id])
  end
  
  def user_params
    params.require(:user).permit(:id, :nome,:sobrenome, :cpf, :sexo, :data_nascimento, :username, :email, :password, 
      :password_confirmation, endereco_attributes: [:id, :cep, :tipo, :endereco, :numero, :complemento, :bairro, :cidade, :estado])
  end
  def endereco_params 
    params.require(:endereco).permit(:id, :cep, :tipo, :endereco, :numero, :complemento, :bairro, :cidade, :estado)
  end
end
