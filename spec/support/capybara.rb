# 1 or 2 のどちらか採用

# 1. ブラウザ操作のテストをする(jsを含んだテストができる)
# Capybara.javascript_driver = :selenium_chrome

# 2. ヘッドレスドライバを利用してブラウザ操作のテストをする(jsを含んだテストができる)
#   Travis CI やJenkinsなどの継続的インテグレーション（CI） 環境で使用される
#     テストの実行中にブラウザのウィンドウが開くのはあまり望ましくない
# 基本はこっち
# Capybara.javascript_driver = :selenium_chrome_headless

RSpec.configure do |config|
  # 単純なブラウザ操作だけのテストで使用する(高速)
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # 複雑なブラウザ操作(jsが必要)があるテストで使用する(jsが実行可能)
  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end
end
