class ChamadosController < ApplicationController
    def index
        @chamados = Chamado.order :nome
        @chamados = Chamado.page(params[:page]).per(10)
    end

    def new
        @chamado = Chamado.new
    end

    def show
        @chamado = Chamado.find(params[:id])
    end

    def create
        valores = params.require(:chamado).permit(:nome, :lastname, :departamento, :equipamento, :descricao, :data)
        @chamado = Chamado.new valores
        if @chamado.save
            flash[:notice] = "Chamado criado com sucesso"
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        id = params[:id]
        Chamado.destroy id
        redirect_to root_path
    end

    def busca
        @nome = params[:nome]
        @chamados = Chamado.where "nome like ?", "%#{@nome}%"
    end

    def edit
        id = params[:id]
        @chamado = Chamado.find(id)
        render :edit
    end

    def update
        id = params[:id]
        @chamado = Chamado.find(id)
        valores = params.require(:chamado).permit(:nome, :lastname, :departamento, :equipamento, :descricao, :data)
        if @chamado.update valores
            flash[:notice] = "Chamado atualizado com sucesso"
            redirect_to root_path
        else
            render :edit
        end
    end

end

