# 在数据库中的配置信息
# 在这里存放 关于 页脚等可能随时改变的的内容
# 使用方法
# SiteConfig.foo
# SiteCofnig.foo = "asdfghjkl"
#
class SiteConfig
  include Mongoid::Document
  include Mongoid::Timestamps

  field :key, type: String
  field :value, type: String

  index key: 1

  validates_presence_of :key
  validates_uniqueness_of :key

  default_scope -> { desc(:updated_at) }

  def self.method_missing(method, *args)
    method_name = method.to_s
    super(method, *args)
  rescue NoMethodError
    if method_name =~ /=$/ 
      var_name = method_name.gsub('=', '')
      value = args.first.to_s
      #save
      if item = self.find_by_key(var_name)
        item.update_attribute(:value, value)
      else
        SiteConfig.create(key: var_name, value: value)
      end
    else
      #item = self.find_by_key(method)? item.value : nil
      if item = self.find_by_key(method)
        item.value
      else
        nil
      end
    end
  end 

  def self.find_by_key(key)
    self.where(key: key.to_s).first
  end

  def self.save_default(key, value)
    self.create(key: key, value: value.to_s) unless find_by_key(key)
  end
end
