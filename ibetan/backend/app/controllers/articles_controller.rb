class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: ['index']

def index
    url_0 = "https://www.city.suita.osaka.jp/kurashi/1018573/1018587/index.html"
    agent = Mechanize.new
    #Mechnaize設計図のインスタンスを型取る
    page = agent.get(url_0)
    #getメソッドでスクレイピングするHPのHTMLを指定する
    newArticle = page.search('li.box a')
    #pageはMechanize::Pageオブジェクト
    
    newArticle.each do |t|
        article = Article.where(title: 'title').first_or_initialize
        article.title = t.inner_text
    #inner_textで、タグの中のメソッドだけ取り出す
        article.url = t.get_attribute('href').to_s
    #get_attributeメソッドで、aタグの中のhref属性の値を取り出す
        #article.save
        puts article.title
        puts article.url
        puts article.save!
    end

    # article = Article.new#where(title: title).first_or_initialize

    # articles_array = []
    # #articles = Article.all
    #     #Arrticleテーブルの要素を全て取得    
    # newsList.each do |a|
    #     articles = Article.includes(:user)
    #     user_id = articles.user.id
    #     title = a.inner_text
    #     url =  a[:href]
    #     articles_array << {
    #         #id: id,
    #         user_id: user_id,    
    #         title: title,
    #         url: url,
    #         #email: articles.user.email,
    #         #created_at: created_at,
    #         #bookmarks: bookmarks.map { |bookmark| {id: bookmark.id, email: bookmark.user.email} },
    #         #favorites: favorites.map { |favorite| {id: favorite.id, email: favorite.user.email} }
    #     }
    articles = Article.includes(:user, [bookmarks: :user], [favorites: :user] )
    articles_array = articles.map do |a|
        {
        id: a.id,
        #articles: a.articles.map { |article| {id: article.id, user_id: article.user.id, email: article.user.email}},
        #user_id: a.user.id,
        #email: a.user.email,
        title:  a.title,
        url: a.url,
        created_at: a.created_at,
        bookmarks: a.bookmarks.map { |bookmark| {id: bookmark.id, email: bookmark.user.email} },
        favorites: a.favorites.map { |favorite| {id: favorite.id, email: favorite.user.email} },
        }
    end

    render json: articles_array, status: :ok

end


end