class AddOauthColumnsToTwitter < ActiveRecord::Migration
  def change
    add_column :twitters, :api_key, :string
    add_column :twitters, :api_secret, :string
    add_column :twitters, :oauth_token, :string
    add_column :twitters, :oauth_secret, :string
  end
end
