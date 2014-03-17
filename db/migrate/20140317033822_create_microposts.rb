class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    #设想按照发布时间的倒序查询用户的所有微博
    #以下是一个多键索引
    add_index :microposts, [:user_id, :created_at]
  end
end
