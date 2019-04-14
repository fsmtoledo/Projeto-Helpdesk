class CreateChamados < ActiveRecord::Migration[5.2]
  def change
    create_table :chamados do |t|
      t.string :nome
      t.string :lastname
      t.string :departamento
      t.string :equipamento
      t.text :descricao
      t.datetime :data

      t.timestamps
    end
  end
end
