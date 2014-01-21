class AddSocialKeywordsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :social_keywords, :string
  end
end
