class Restaurant < ApplicationRecord
  # 設定 name 欄位爲必填
  validates_presence_of :name
end
