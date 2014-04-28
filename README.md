# Softbank HealthCare Client

[Softbank HealthCare](https://healthcare.mb.softbank.jp/pc/) client library for ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'softbank-healthcare-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install softbank-healthcare-client

## Usage

Require `softbank_healthcare` library.

```ruby
require 'softbank_healthcare'
```

Login to SoftBank HealthCare web service. You can use 301SI tel number and password.

```ruby
client = SoftBankHealthCare::Client.new telno: '09012345678', password: '1234'
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

if you want fetch yesterday data, you can set date.

```ruby
client.date = Date.today - 1
client.weight
```

## Contributing

1. Fork it ( http://github.com/shunirr/softbank-healthcare-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# License

The MIT License (MIT)

Copyright (c) Shinshun Kuniyoshi 2014

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
