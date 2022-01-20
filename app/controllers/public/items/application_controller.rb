class Public::Items::ApplicationController < ApplicationController
 
# カートのデータが作成されていないため、カート自体を作成する必要がある。カートがないときはカートを作成して取得し、すでに作成されていれば作成する必要はない。
  # current_customer.cartがnilの場合は、カートが作成される→itemのidを取得→cartのなかにitem_idを保存する→実行後カートの中身へリダイレクト
  
end
