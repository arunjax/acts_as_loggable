class RecentActivity < ActiveRecord::Base
    belongs_to :onobject, :polymorphic => true
    belongs_to :user
end