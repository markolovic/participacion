class RemoveCustomPageLocale < ActiveRecord::Migration
  def change
    remove_column :site_customization_pages, :locale, :string
  end
end
