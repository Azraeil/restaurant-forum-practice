class Favorite < ApplicationRecord
  belongs_to :user

  # counter_cache 可以自動回傳 size method 的結果(計算關聯物件的數量)
  # 並把這個結果更新在關聯 Model 的欄位：{table_name}_count
  # 所以在這邊就會是：favorites_count
  belongs_to :restaurant, counter_cache: true
end
