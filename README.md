# Softbank HealthCare Client

[Softbank HealthCare](https://healthcare.mb.softbank.jp/pc/) client library for ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'healthcare'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install healthcare

## Usage

Require `healthcare` library.

```ruby
require 'healthcare'
```

Login to healthcare web service. You can use 301SI tel number and password.

```ruby
client = HealthCare::Client.new telno: '09012345678', password: '1234'
```

Fetch and show your health data.

```ruby
client.weight # 体重(kg)
client.body_fat # 体脂肪率(%)
client.bmi # BMI
client.basal_metabolism # 基礎代謝
client.physical_age # 身体年齢(歳)
client.skeletal_muscle_level # 骨格筋レベル
client.bone_level # 骨レベル
client.visceral_fat_level # 内臓脂肪レベル
client.water_content # 水分量 (%)
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/healthcare/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
