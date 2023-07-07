class Public::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
  end



  def search
    #ここで空の配列を作ります
    @games = []
    @title = params[:title]
    if @title.present?
      #この部分でresultsに楽天APIから取得したデータ（jsonデータ）を格納します。
      #今回は書籍のタイトルを検索して、一致するデータを格納するように設定しています。
      results = RakutenWebService::Books::Game.search({
        title: @title,
      })
      #この部分で「@books」にAPIからの取得したJSONデータを格納していきます。
      #read(result)については、privateメソッドとして、設定しております。
      results.each do |result|
        game = Game.new(read(result))
        @games << game
      end
    end
    #「@books」内の各データをそれぞれ保存していきます。
    #すでに保存済の本は除外するためにunlessの構文を記載しています。
    @games.each do |game|
      unless Game.all.include?(game)
        game.save
      end
    end
  end

  private
  #「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
  def read(result)
    title = result["title"]
    isbn = result["isbn"]
    label = result["label"]
    hardware = result["hardware"]
    salesDate = result["salesDate"]
    mediumImageUrl = result["mediumImageUrl"]
    largeImageUrl = result["largeImageUrl"]

    {
      title: title,
      isbn: isbn,
      label: label,
      hardware: hardware,
      salesDate: salesDate,
      mediumImageUrl: mediumImageUrl,
      largeImageUrl: largeImageUrl
    }
  end
end

