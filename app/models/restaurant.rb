class Restaurant < ApplicationRecord
  # 設定欄位爲必填
  validates_presence_of :name
end
