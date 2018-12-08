class ApplicationRoot < Grape::API
  prefix 'api'
  version 'v1'
  mount V1::Base
end
