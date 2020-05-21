class TweetsController < ApplicationController
  def index
    @side = ["ホーム", "話題を検索", "通知", "メッセージ", "ブックマーク", "リスト", "プロフィール", "もっと見る"]
  end
end