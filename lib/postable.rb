# lib/postable.rb

module Postable

  def self.included(klass)
    klass.instance_eval do
      has_one :post, :as => :postable
      alias_method_chain :post, :autocreate

      [:user, :created_at, :updated_at].each do |method|
        delegate method, "#{method}=", :to => :post
      end
    end
  end

  def post_with_autocreate
    post_without_autocreate || build_post

  end
end
