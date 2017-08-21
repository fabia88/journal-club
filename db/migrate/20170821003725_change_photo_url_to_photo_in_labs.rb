class ChangePhotoUrlToPhotoInLabs < ActiveRecord::Migration[5.0]
  def change
    rename_column :labs, :photo_url, :photo
  end
end
